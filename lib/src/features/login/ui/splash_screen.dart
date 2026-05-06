

import 'package:tripBreak/src/core/core/utils/extension.dart';

import '../../../../common_imports.dart';
import '../../../core/core/constants/constants_index.dart';
import '../../../core/core/theme/colors.dart';
import '../../../core/core/utils/print.dart';
import '../../../core/core/utils/routes.dart';
import '../login_index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    configLoading();
    getVersion();
  }

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  Future<void> getVersion() async {
    try {
      final LoginProvider loginProvider =
      Provider.of<LoginProvider>(context, listen: false);

      final PackageInfo packageInfo = await PackageInfo.fromPlatform();

      String appVersionString =
      packageInfo.version.split('.').take(2).join('.');

      double appVersion = double.tryParse(appVersionString) ?? 0.0;

      printDebug(
        "Version: ${packageInfo.version} "
            "Build: ${packageInfo.buildNumber} "
            "Parsed: $appVersion",
      );

      loginProvider.setAppVersion(appVersion);

      bool value = await loginProvider.getVersionCheckApiCall(appVersion);

      printDebug("API RESULT => $value");

      if (!mounted) return;

      if (value) {
        EasyLoading.dismiss();
        Navigator.pushReplacementNamed(
          context,
          NavigateRoutes.navigateToLoginScreen(),
        );
      } else {
        printDebug("Version check failed");
      }
    } catch (e) {
      printDebug("Splash Error => $e");
      // fallback navigation
      EasyLoading.dismiss();
      if (!mounted) return;
      Navigator.pushReplacementNamed(
        context,
        NavigateRoutes.navigateToLoginScreen(),
      );
    }finally{
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ThemeColors.whiteColor,
        child: Center(
            child: Image.asset(Assets.appLogo,
                height: context.width * .75,
                width: context.width * .75,
                fit: BoxFit.fill)));
  }
}
