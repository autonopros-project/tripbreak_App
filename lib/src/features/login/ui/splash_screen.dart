

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
    configLoading();
    getVersion();
    super.initState();
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
    LoginProvider loginProvider = Provider.of(context, listen: false);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String version = packageInfo.buildNumber;
    dynamic appVersionString = packageInfo.version
        .split('.')
        .take(2)
        .join('.'); // Extract the first two parts
    double appVersion = double.tryParse(appVersionString) ?? 0.0;
    printDebug(
        "packageInfo.version ${packageInfo.version} ${packageInfo.buildNumber} $appVersion $appVersionString");
    // Set the app version in LoginProvider
    loginProvider.setAppVersion(appVersion);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loginProvider.getVersionCheckApiCall(appVersion).then((bool value) {
        if (value) {
          NavigateRoutes.navigateTo();
        }
      });
    });
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
