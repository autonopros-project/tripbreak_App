import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../../../../common_imports.dart';
import '../../../core/core/constants/constant_text.dart';
import '../../../core/core/network/common_repository.dart';
import '../../../core/core/network/network_index.dart';
import '../../../core/core/utils/utils.dart';
import '../../../core/core/utils/shared_preference.dart';
import '../../../dataModel/loginModel.dart';

class LoginProvider extends ChangeNotifier {
  double appVersion = 0.0;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController mobileNoController = TextEditingController();
  final FocusNode mobileNoFocusNode = FocusNode();
  final TextEditingController otpController = TextEditingController();
  final FocusNode otpFocusNode = FocusNode();

  bool hasRequestedOtp = false;
  bool isUserExist = false;
  String getApiOtp = Constants.empty;
  int timer = 30;

  loginModel? _loginModel;
  String? _selectedRole;
  String? _selectedPlantId;
  List<PlantInfo> _plants = [];

  String? get selectedRole => _selectedRole;
  String? get selectedPlantId => _selectedPlantId;
  List<PlantInfo> get plants => _plants;
  List<RolesInfo> get roles => _loginModel?.mItem2?.rolesInfo ?? [];

  void setSelectedRole(String? role) {
    _selectedRole = role;
    LocalStorages.saveUserData(localSaveType: LocalSaveType.role, value: role ?? '');
    notifyListeners();
  }

  void setSelectedPlant(String plantId) {
    _selectedPlantId = plantId;
    LocalStorages.saveUserData(localSaveType: LocalSaveType.plant, value: plantId);
    notifyListeners();
  }

  void setAppVersion(double version) {
    appVersion = version;
    notifyListeners();
  }

  Future<void> saveLoginModel(loginModel model) async {
    _loginModel = model;
    notifyListeners();

    // Save complete model JSON
    final modelJson = jsonEncode(model.toJson());
    await LocalStorages.saveUserData(
      localSaveType: LocalSaveType.loginModel,
      value: modelJson,
    );

    // Save mobile number
    final mobileNo = model.mItem2?.mobileNo.toString() ?? '';
    await LocalStorages.saveUserData(
      localSaveType: LocalSaveType.mobileNumber,
      value: mobileNo,
    );

    // Save plant info
    final plantData = model.mItem2?.plantInfo;
    print("🔍 Raw plant data from model: $plantData");

    if (plantData != null && plantData.isNotEmpty) {
      _plants = plantData;

      // Check if PlantID already saved
      final existingPlantId = await LocalStorages.getPlantID();
      if (existingPlantId == null || existingPlantId.isEmpty) {
        final firstPlantId = _plants.first.plantID;
        if (firstPlantId != null && firstPlantId.isNotEmpty) {
          _selectedPlantId = firstPlantId;
          print("💾 Saving PlantID: $_selectedPlantId");

          await LocalStorages.saveUserData(
            localSaveType: LocalSaveType.plantID,
            value: _selectedPlantId!,
          );

          print("✅ Default PlantID saved: $_selectedPlantId");
        } else {
          print("❌ No valid PlantID found to save.");
        }
      } else {
        _selectedPlantId = existingPlantId;
        print("📤 Using existing PlantID from local storage: $_selectedPlantId");
      }
    } else {
      print("❌ plantInfo is null or empty.");
    }

    notifyListeners();
  }

  Future<void> loadLoginModelFromLocalStorage() async {
    _loginModel = await LocalStorages.getLoginModel();
    _selectedRole = await LocalStorages.getRole();
    _selectedPlantId = await LocalStorages.getPlantID();

    final plantData = _loginModel?.mItem2?.plantInfo;
    if (plantData != null && plantData.isNotEmpty) {
      _plants = plantData;
    }

    notifyListeners();
  }

  void resetOtpFlow() {
    hasRequestedOtp = false;
    isUserExist = false;
    getApiOtp = Constants.empty;
    otpController.clear();
    otpFocusNode.requestFocus();
    notifyListeners();
  }

  void startTimer() {
    timer = 30;
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      if (timer < 1) {
        t.cancel();
      } else {
        timer--;
        notifyListeners();
      }
    });
  }

  Future<void> getOtpApiCall() async {
    if (hasRequestedOtp) return;

    hasRequestedOtp = true;
    notifyListeners();

    await Utils.fetchDeviceInfo();

    isUserExist = false;
    getApiOtp = Constants.empty;
    mobileNoFocusNode.unfocus();

    final String deviceID = Utils.deviceInfo['deviceID'] ?? '';
    final String deviceName = Utils.deviceInfo['device'] ?? '';
    final String osVersion = Utils.deviceInfo['osVersion'] ?? '';
    final String appName = 'Trip Break';
    final String appVersionString = appVersion.toString();

    final HTTPResponse<dynamic> response = await ApiCalling.callApi(
      apiUrl: AppUrls.getOtpForAuthorisedManagerUrl,
      apiFunType: APITypes.post,
      sendingData: {
        'MobileNo': mobileNoController.text.trim(),
        'DeviceID': deviceID,
        'AppName': appName,
        'AppVersion': appVersionString,
        'DeviceName': deviceName,
        'OSVersion': osVersion,
      },
    );

    if (response.statusCode == 200) {
      try {
        final responseBody = response.body;
        final loginModel model = loginModel.fromJson(responseBody);

        await saveLoginModel(model);

        debugPrint("🌿 Final PlantID in use: $_selectedPlantId");

        final String otp = model.mItem2?.oTP ?? '';
        if (otp.isNotEmpty && otp != '0000') {
          getApiOtp = otp;
          isUserExist = true;
          notifyListeners();
          startTimer();
          EasyLoading.showSuccess(ConstantMessage.otpSentSuccessfully);
        } else {
          EasyLoading.showError(ConstantMessage.invalidCrediantials);
        }
      } catch (e, stack) {
        print("Exception during OTP API processing: $e");
        print("Stack trace: $stack");
        EasyLoading.showError('Something went wrong. Please try again.');
      }
    } else {
      EasyLoading.showError(ConstantMessage.invalidCrediantials);
    }

    notifyListeners();
  }

  Future<void> resendOtpApiCall() async {
    getApiOtp = Constants.empty;
    mobileNoFocusNode.unfocus();

    final HTTPResponse<dynamic> response = await ApiCalling.callApi(
      apiUrl: AppUrls.resendOTPForAuthorisedManagersUrl,
      apiFunType: APITypes.put,
      sendingData: {'mobileNumber': mobileNoController.text.trim()},
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final otp = responseBody["m_Item2"]?["OTP"]?.toString() ?? '';

      if (otp.isNotEmpty && otp != '0000') {
        getApiOtp = otp;
        startTimer();
        EasyLoading.showSuccess(ConstantMessage.otpReSentSuccessfully);
      } else {
        EasyLoading.showError(ConstantMessage.invalidCrediantials);
      }
    } else {
      EasyLoading.showInfo(ConstantMessage.somethingWentWrongPleaseTryAgain);
    }

    notifyListeners();
  }

  Future<bool> getVersionCheckApiCall(double version) async {
    final HTTPResponse<dynamic> response = await ApiCalling.callApi(
      apiFunType: APITypes.get,
      apiUrl: AppUrls.getVersionUrl,
    );

    if (response.statusCode == 200) {
      String res = response.body ?? '0';
      double responseVersion = double.tryParse(res) ?? 0.0;

      if (responseVersion > version) {
        EasyLoading.showInfo('App Update Required');
        if (Platform.isAndroid) {
          Utils.launchInBrowser(Uri.parse("https://play.google.com/store/apps/details?id=com.hmwssb_swc"));
        }
        notifyListeners();
        return false;
      }
    }

    notifyListeners();
    return true;
  }

  @override
  void dispose() {
    mobileNoController.dispose();
    mobileNoFocusNode.dispose();
    otpController.dispose();
    otpFocusNode.dispose();
    super.dispose();
  }
}
