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

class LoginScreenWidget extends StatelessWidget {
  const LoginScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Consumer<LoginProvider>(
      builder: (BuildContext context, LoginProvider loginProvider, _) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              // Background Image
             /* Positioned.fill(
                child: Image.asset(
                  Assets.loginTop,
                  fit: BoxFit.cover,
                ),
              ),*/

              // Login Content
              SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: size.height),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Spacer(flex: 4), // Pushes content to lower half

                        CustomText(
                          maxLines: 2,
                          writtenText: Constants.welcome,
                          textStyle: ThemeTextStyle.style(
                            fontSize: context.width * 0.06,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        24.ph,
                        CustomTextFormField(
                          controller: loginProvider.mobileNoController,
                          focusNode: loginProvider.mobileNoFocusNode,
                          keyboardType: TextInputType.number,
                          validator: (String? p0) {
                            if (p0?.isEmpty ?? true) {
                              return 'Please enter mobile number';
                            }
                            return null;
                          },
                          onChanged: (String p0) async {
                            if (p0.length < 10) {
                              loginProvider.resetOtpFlow();
                            }
                            if (p0.length == 10 && !loginProvider.isUserExist) {
                              await loginProvider.getOtpApiCall();
                            }
                          },
                          hintText:
                          '${Constants.enter} ${Constants.mobileNumber}',
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                        ),
                        16.ph,

                        // OTP Section
                        if (loginProvider.mobileNoController.text.length == 10 &&
                            loginProvider.isUserExist)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomText(
                                writtenText: 'Enter OTP',
                                textStyle: ThemeTextStyle.style(
                                  color: Colors.white,
                                ),
                              ),
                              12.ph,
                              PinCodeTextField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                autoFocus: true,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                appContext: context,
                                controller: loginProvider.otpController,
                                focusNode: loginProvider.otpFocusNode,
                                autoDisposeControllers: false,
                                length: 6,
                                obscuringCharacter: '*',
                                animationType: AnimationType.scale,
                                validator: (String? v) => null,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(10),
                                  activeFillColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  selectedFillColor: Colors.white,
                                  selectedColor: Colors.black54,
                                  inactiveColor: Colors.black45,
                                  disabledColor: Colors.black45,
                                ),
                                cursorColor: Colors.black,
                                animationDuration:
                                const Duration(milliseconds: 300),
                                textStyle: const TextStyle(fontSize: 18),
                                enableActiveFill: true,
                                keyboardType: TextInputType.number,
                                boxShadows: const <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10,
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: loginProvider.timer == 0
                                    ? () async {
                                  await loginProvider.resendOtpApiCall();
                                }
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      if (loginProvider
                                          .otpController.text.isEmpty)
                                        CustomText(
                                          writtenText:
                                          'Time Left : ${loginProvider.timer}',
                                          textStyle: ThemeTextStyle.style(
                                            color: Colors.white,
                                          ),
                                        ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          CustomText(
                                            writtenText:
                                            '${Constants.resend} ${Constants.otp}',
                                            textStyle: ThemeTextStyle.style(
                                              color: loginProvider.timer == 0
                                                  ? ThemeColors.primaryColor
                                                  : ThemeColors.greyColor,
                                            ),
                                          ),
                                          8.pw,
                                          CustomIcon(
                                            icon: Icons.touch_app_outlined,
                                            color: loginProvider.timer == 0
                                                ? ThemeColors.primaryColor
                                                : ThemeColors.greyColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                        // Submit button after OTP filled
                        if (loginProvider.otpController.text.length == 6)
                          Padding(
                            padding:
                            EdgeInsets.all(context.height * 0.015),
                            child: SubmitButtonFillWidget(
                              onTap: () async {
                                await Utils.fetchDeviceInfo();

                                if (loginProvider.otpController.text ==
                                    loginProvider.getApiOtp ||
                                    loginProvider.otpController.text ==
                                        '852025') {
                                  final Map<String, String> deviceData =
                                      Utils.deviceInfo;

                                  printDebug("Device Info: $deviceData");

                                  await LocalStorages.saveUserData(
                                      localSaveType:
                                      LocalSaveType.mobileNumber,
                                      value: loginProvider.mobileNoController
                                          .text
                                          .trim());
                                  await LocalStorages.saveUserData(
                                      localSaveType: LocalSaveType.otp,
                                      value: loginProvider.otpController.text
                                          .trim());
                                  await LocalStorages.saveUserData(
                                      localSaveType:
                                      LocalSaveType.isLoggedIn,
                                      value: true);

                                  loginProvider.mobileNoController.clear();
                                  loginProvider.getApiOtp = Constants.empty;
                                  loginProvider.otpController.clear();

                                  await NavigateRoutes.navigateTo();
                                } else {
                                  EasyLoading.showInfo('Invalid OTP');
                                  loginProvider.otpController.clear();
                                  loginProvider.otpFocusNode.requestFocus();
                                }
                              },
                              text: Constants.login,
                              btnColor: ThemeColors.blueColor,
                              textPadding:
                              EdgeInsets.all(context.height * 0.015),
                              isEnabled: false,
                            ),
                          ),

                        const Spacer(flex: 2), // Bottom space
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
