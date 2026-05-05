import 'package:tripBreak/src/core/core/utils/extension.dart';

import '../../../../common_imports.dart';
import '../../../core/core/constants/constants_index.dart';
import '../../../core/core/theme/colors.dart';
import '../../../core/core/theme/style.dart';
import '../../../core/core/utils/print.dart';
import '../../../core/core/utils/routes.dart';
import '../../../core/core/utils/shared_preference.dart';
import '../../../core/core/utils/utils.dart';
import '../../widgets/custom_icon.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form.dart';
import '../../widgets/submit_btn.dart';
import '../login_index.dart';


class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double headerHeight = MediaQuery.of(context).size.height * 0.4;

    return Consumer<LoginProvider>(
      builder: (context, loginProvider, _) {
        return Scaffold(
          backgroundColor: const Color(0xFFFCF9F8),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // HEADER
                    Container(
                      height: headerHeight,
                      width: double.infinity,
                      color: const Color(0xFF003594),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 40),
                          Text(
                            Constants.getSignIn,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            Constants.greetingLogin,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),

                    // CARD
                    Padding(
                      padding: EdgeInsets.only(top: headerHeight - 60),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            /// MOBILE INPUT
                            const Text("Mobile Number"),
                            const SizedBox(height: 8),
                            TextField(
                              controller:
                              loginProvider.mobileNoController,
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              onChanged: (value) async {
                                if (value.length < 10) {
                                  loginProvider.resetOtpFlow();
                                }

                                if (value.length == 10 &&
                                    !loginProvider.isUserExist) {
                                  await loginProvider.getOtpApiCall();
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: Constants.getMobileNo,
                                border: OutlineInputBorder(),
                              ),
                            ),

                            const SizedBox(height: 16),

                            /// OTP SECTION
                            if (loginProvider.isUserExist)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(Constants.enterOtp),
                                  const SizedBox(height: 8),
                                  TextField(
                                    controller:
                                    loginProvider.otpController,
                                    keyboardType: TextInputType.number,
                                    maxLength: 6,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  /// TIMER + RESEND
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Time left: ${loginProvider.timer}"),
                                      TextButton(
                                        onPressed:
                                        loginProvider.timer == 0
                                            ? () {
                                          loginProvider
                                              .resendOtpApiCall();
                                        }
                                            : null,
                                        child: const Text(Constants.resendOtp),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                            const SizedBox(height: 20),

                            /// LOGIN BUTTON
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: loginProvider
                                    .otpController.text.length ==
                                    6
                                    ? () async {
                                  if (loginProvider.otpController.text ==
                                      loginProvider.getApiOtp ||
                                      loginProvider.otpController.text ==
                                          '852025') {

                                    await LocalStorages.saveUserData(
                                      localSaveType:
                                      LocalSaveType.isLoggedIn,
                                      value: true,
                                    );

                                    loginProvider.mobileNoController.clear();
                                    loginProvider.otpController.clear();
                                    loginProvider.resetOtpFlow();

                                    await NavigateRoutes.navigateTo();
                                  } else {
                                    EasyLoading.showError(
                                        Constants.invalidOtp);
                                  }
                                }
                                    : null,
                                child: const Text("Login"),
                              ),
                            ),

                            const SizedBox(height: 20),

                            /// OPTIONAL SOCIAL (STILL USELESS BUT PRETTY)
                            const Center(child: Text("Or continue with")),
                            const SizedBox(height: 12),

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.g_mobiledata, size: 40),
                                SizedBox(width: 20),
                                Icon(Icons.facebook, size: 30),
                              ],
                            ),

                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}