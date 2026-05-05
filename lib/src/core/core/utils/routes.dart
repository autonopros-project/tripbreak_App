// ignore_for_file: use_build_context_synchronously



import 'package:tripBreak/src/core/core/utils/shared_preference.dart';

import '../../../../common_imports.dart';
import '../../../features/Home/ui/homescreen.dart';
import '../../../features/login/login_index.dart';


class NavigateRoutes {
  /// Define a global key for the navigator
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Define all the routes here
  static dynamic navigateTo() {
    if (LocalStorages.getIsLoggedIn() == true) {
      // if (LocalStorages.getRole() == Constants.tankerOwnerRole) {
      return Navigator.pushAndRemoveUntil(
          navigatorKey.currentContext!,
          MaterialPageRoute<Widget>(builder: (_) => const HomeScreen()),
              (Route<dynamic> route) => false);
      // } else {
      //   return Navigator.pushAndRemoveUntil(
      //       navigatorKey.currentContext!,
      //       MaterialPageRoute<Widget>(
      //           builder: (_) => const
      //
      //               ManagerDashBoardScreenWidget()),
      //       (Route<dynamic> route) => false);
      // }
      //  else {
      //   EasyLoading.showError("You can't login");
      //   return navigateToLoginScreen();
      // }
    } else {
      return navigateToLoginScreen();
    }
  }

  ///Defined only login screen route
  static dynamic navigateToLoginScreen({bool isLogoutTap = false}) async {
    if (isLogoutTap) {
      await LocalStorages.logOutUser();
      return Navigator.pushAndRemoveUntil(
          navigatorKey.currentContext!,
          MaterialPageRoute<Widget>(builder: (_) => const SignInPage()),
              (Route<dynamic> route) => false);
    }
    return Timer(
        const Duration(seconds: 5),
            () => Navigator.pushAndRemoveUntil(
            navigatorKey.currentContext!,
            MaterialPageRoute<Widget>(
                builder: (_) => const SignInPage()),
                (Route<dynamic> route) => false));
  }

  static dynamic navigateToOTPScreen() {
    // return Navigator.pushReplacement(
    //     navigatorKey.currentContext!,
    //     MaterialPageRoute<Widget>(
    //         builder: (_) => const OTPVerificationScreen()));
  }

  static Future<Widget?> navigatePush(
      {required Widget widget, BuildContext? context}) {
    return Navigator.push(context ?? navigatorKey.currentContext!,
        MaterialPageRoute<Widget>(builder: (_) => widget));
  }

  static void navigatePop({BuildContext? context}) {
    return Navigator.pop(context ?? navigatorKey.currentContext!);
  }
}
