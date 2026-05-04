import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:tripBreak/src/core/core/utils/print.dart';

import '../../../../common_imports.dart';

class Utils {
  static Map<String, String> deviceInfo = {};
  static Position? currentPosition;
  static StreamSubscription<Position>? positionStreamSubscription;

  static void startLocationStream() {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10, // Update every 10 meters
    );

    positionStreamSubscription =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
          currentPosition = position;
          printDebug("Updated Location: ${position.latitude}, ${position.longitude}");
        }, onError: (e) {
          EasyLoading.showError('Error getting location updates: $e');
        });
  }

// Call this method when you want to stop listening
  static void stopLocationStream() {
    positionStreamSubscription?.cancel();
  }

  static DateTime get currentDateTime => DateTime.now();
  static TimeOfDay get currentTime => TimeOfDay.now();
  static final DateFormat dmyDateFrmt = DateFormat('dd-MM-yyyy');
  static final DateFormat ymdDateFrmtWithTime =
      DateFormat('yyyy-MM-dd HH:mm:ss');
  static final DateFormat ymdDateFrmt = DateFormat('yyyy-MM-dd');
  static final DateFormat dMonthNameYDateFrmt = DateFormat('dd-MMM-yyyy');

  // Date in DD-MM-YYYY Format
  static String getStringDateFrmtDMY({DateTime? dT}) {
    return dmyDateFrmt.format(dT ?? currentDateTime);
  }

  static Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      await EasyLoading.showInfo('Could not launch $url');
    }
  }

  static Future<void> launchURL(String url) async {
    if (url.isEmpty) {
      printDebug("URL is empty");
      EasyLoading.showInfo('URL is empty');
      return;
    }

    final Uri? uri = Uri.tryParse(url.trim());
    if (uri == null) {
      printDebug("Invalid URI: $url");
      EasyLoading.showInfo('Invalid URL: $url');
      return;
    }

    printDebug("Attempting to launch: $uri");
    bool canLaunch = await canLaunchUrl(uri);
    printDebug("Can launch: $canLaunch");

    if (canLaunch) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      printDebug("Failed to launch URL: $uri");
      EasyLoading.showError('Unable to open URL. Please try again later.');
    }
  }



  /// Fetch device information
  static Future<void> fetchDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        deviceInfo = {
          'device': androidInfo.model ?? 'Unknown',
          'brand': androidInfo.brand ?? 'Unknown',
          'manufacturer': androidInfo.manufacturer ?? 'Unknown',
          'osVersion': 'Android ${androidInfo.version.release}',
          'sdkInt': '${androidInfo.version.sdkInt}', // SDK version
          'hardware': androidInfo.hardware ?? 'Unknown',
          'deviceID': androidInfo.id ?? 'Unknown',
          'isPhysicalDevice': androidInfo.isPhysicalDevice ? 'Yes' : 'No',

        };
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        deviceInfo = {
          'device': iosInfo.utsname.machine ?? 'Unknown',
          'systemName': iosInfo.systemName ?? 'iOS',
          'osVersion': iosInfo.systemVersion ?? 'Unknown',
          'model': iosInfo.model ?? 'Unknown',
          'deviceID': iosInfo.identifierForVendor ?? 'Unknown',
          'isPhysicalDevice': iosInfo.isPhysicalDevice ? 'Yes' : 'No',
        };
      }
    } catch (e) {
      EasyLoading.showError('Failed to fetch device info: $e');
    }
  }




  static Future<dynamic> openCamera({bool getBase64 = true}) async {
    try {
      // await Permission.camera.request();
      if (await Permission.camera.request().isGranted) {
        final XFile? image = await ImagePicker()
            .pickImage(source: ImageSource.camera, imageQuality: 40);
        if (getBase64 == true) {
          final Uint8List? base64Byte = await image?.readAsBytes();
          if (base64Byte != null) {
            String base64Encoded = base64Encode(base64Byte);
            return base64Encoded;
          }
          // final Uint8List imageBase64 = base64.decode(base64Encoded.toString());
          // print('base64 -> $base64Encoded');
          // print('base64 -> $imageBase64');
          return null;
        }
        return image;
      } else {
        EasyLoading.showToast('Allow Camera Permission Manually',
            toastPosition: EasyLoadingToastPosition.bottom);
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }


  static Future<void> callLocApi() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await EasyLoading.showToast(
            'Location permissions are denied. Please allow the permissions.',
            toastPosition: EasyLoadingToastPosition.bottom);

        await Future<void>.delayed(
            const Duration(seconds: 3), () => Geolocator.openAppSettings());
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await EasyLoading.showToast(
          'Location permissions are permanently denied. Please enable it in app settings.',
          toastPosition: EasyLoadingToastPosition.bottom);
      await Future<void>.delayed(
          const Duration(seconds: 3), () => Geolocator.openAppSettings());
      return;
    }

    // Start streaming location updates
    startLocationStream();
  }


  /// Helper function to get the current position of the device
  static Future<void> _getCurrentPosition() async {
    try {
      currentPosition = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
      );
    } on Exception catch (e) {
      await EasyLoading.showError('Failed to get current position: $e');
    }
  }
}
