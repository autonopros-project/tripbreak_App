import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../dataModel/loginModel.dart';

enum LocalSaveType {
  isLoggedIn,
  name,
  mobileNumber,
  role,
  otp,
  rolesData,
  loginModel,
  plant,     // PlantPkey (e.g., 1)
  plantID,   // PlantID (e.g., PL1)
}

class LocalStorages {
  static SharedPreferences? _prefs;

  /// Must be called in `main()` before any usage
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    log("✅ SharedPreferences initialized");
  }

  static bool _checkPrefsInitialized() {
    if (_prefs == null) {
      log("❗ SharedPreferences not initialized. Call `LocalStorages.init()` in main().");
      return false;
    }
    return true;
  }

  /// Generic save method with logging
  static Future<void> saveUserData({
    required LocalSaveType localSaveType,
    required dynamic value,
  }) async {
    if (!_checkPrefsInitialized()) return;

    dynamic val = value ?? (localSaveType == LocalSaveType.isLoggedIn ? false : '');
    log("💾 Saving [${localSaveType.name}] = $val");

    switch (localSaveType) {
      case LocalSaveType.isLoggedIn:
        await _prefs!.setBool(ShareKey.isLoggedIn, val);
        break;
      case LocalSaveType.name:
        await _prefs!.setString(ShareKey.name, val);
        break;
      case LocalSaveType.mobileNumber:
        await _prefs!.setString(ShareKey.mobileNumber, val);
        break;
      case LocalSaveType.role:
        await _prefs!.setString(ShareKey.role, val);
        break;
      case LocalSaveType.otp:
        await _prefs!.setString(ShareKey.otp, val);
        break;
      case LocalSaveType.rolesData:
        await _prefs!.setString(ShareKey.rolesData, val);
        break;
      case LocalSaveType.loginModel:
        await _prefs!.setString(ShareKey.loginModel, val);
        break;
      case LocalSaveType.plant:
        await _prefs!.setString(ShareKey.plant, val);
        break;
      case LocalSaveType.plantID:
        await _prefs!.setString(ShareKey.plantID, val);
        break;
    }
  }

  // Getters
  static bool getIsLoggedIn() {
    if (!_checkPrefsInitialized()) return false;
    return _prefs!.getBool(ShareKey.isLoggedIn) ?? false;
  }

  static String getMobileNumber() {
    if (!_checkPrefsInitialized()) return '';
    return _prefs!.getString(ShareKey.mobileNumber) ?? '';
  }

  static String getName() {
    if (!_checkPrefsInitialized()) return '';
    return _prefs!.getString(ShareKey.name) ?? '';
  }

  static String getRole() {
    if (!_checkPrefsInitialized()) return '';
    return _prefs!.getString(ShareKey.role) ?? '';
  }

  static String getOtp() {
    if (!_checkPrefsInitialized()) return '';
    return _prefs!.getString(ShareKey.otp) ?? '';
  }

  static String getRolesData() {
    if (!_checkPrefsInitialized()) return '';
    return _prefs!.getString(ShareKey.rolesData) ?? '';
  }

  static String getPlant() {
    if (!_checkPrefsInitialized()) return '';
    final plant = _prefs!.getString(ShareKey.plant) ?? '';
    log("📤 Loaded PlantPkey from local storage: $plant");
    return plant;
  }

  static String getPlantID() {
    if (!_checkPrefsInitialized()) return '';
    final plantId = _prefs!.getString(ShareKey.plantID) ?? '';
    log("📤 Loaded PlantID from local storage: $plantId");
    if (plantId.isEmpty) {
      log("❌ Plant ID is not available in local storage.");
    }
    return plantId;
  }

  static bool hasPlantID() {
    if (!_checkPrefsInitialized()) return false;
    return _prefs!.containsKey(ShareKey.plantID) &&
        (_prefs!.getString(ShareKey.plantID)?.isNotEmpty ?? false);
  }

  static loginModel? getLoginModel() {
    if (!_checkPrefsInitialized()) return null;
    try {
      final jsonData = _prefs!.getString(ShareKey.loginModel) ?? '';
      if (jsonData.isEmpty) return null;
      return loginModel.fromJson(jsonDecode(jsonData));
    } catch (e) {
      log('❌ Error parsing loginModel from local storage: $e');
      return null;
    }
  }

  static Future<void> logOutUser() async {
    if (!_checkPrefsInitialized()) return;
    await _prefs!.clear();
    log("👋 Cleared all user data on logout.");
  }
}

class ShareKey {
  static const String isLoggedIn = "isloggedin";
  static const String name = "name";
  static const String mobileNumber = "mobile_number";
  static const String role = "role";
  static const String otp = "otp";
  static const String rolesData = "roles_data";
  static const String loginModel = "login_model";
  static const String plant = "plant";         // PlantPkey (int as String)
  static const String plantID = "plant_id";    // PL1, PL2, etc.
}
