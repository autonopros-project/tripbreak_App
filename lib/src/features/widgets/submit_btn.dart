
import '../../../common_imports.dart';
import '../../core/core/theme/colors.dart';
import '../../core/core/theme/style.dart';
import 'custom_icon.dart';
import 'custom_text.dart';

class SubmitButtonFillWidget extends StatelessWidget {
  const SubmitButtonFillWidget({
    required this.onTap,
    required this.text,
    required this.btnColor,
    this.textColor = ThemeColors.whiteColor,
    this.borderRadius = 4.0,
    this.textPadding = const EdgeInsets.all(8.0),
    this.borderRadiusDesign,
    super.key, required bool isEnabled,
  });
  final String text;
  final Color btnColor;
  final Color textColor;
  final void Function() onTap;
  final double borderRadius;
  final EdgeInsetsGeometry textPadding;
  final BorderRadiusGeometry? borderRadiusDesign;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius:
                borderRadiusDesign ?? BorderRadius.circular(borderRadius),
          ),
          child: Padding(
            padding: textPadding,
            child: Center(
              child: CustomText(
                writtenText: text,
                textStyle: ThemeTextStyle.style(color: textColor),
              ),
            ),
          ),
        ));
  }
}

class SubmitButtonUnFillWidget extends StatelessWidget {
  const SubmitButtonUnFillWidget({
    required this.onTap,
    required this.text,
    required this.btnColor,
    this.textColor = ThemeColors.whiteColor,
    this.borderRadius = 4.0,
    this.textPadding = const EdgeInsets.all(8.0),
    this.borderRadiusDesign,
    super.key,
  });
  final String text;
  final Color btnColor;
  final Color textColor;
  final void Function() onTap;
  final double borderRadius;
  final EdgeInsetsGeometry textPadding;
  final BorderRadiusGeometry? borderRadiusDesign;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: ThemeColors.whiteColor,
            border: Border.all(
              color: btnColor,
            ),
            borderRadius:
                borderRadiusDesign ?? BorderRadius.circular(borderRadius),
          ),
          child: Padding(
            padding: textPadding,
            child: Center(
              child: CustomText(
                writtenText: text,
                textStyle: ThemeTextStyle.style(
                  color: textColor,
                ),
              ),
            ),
          ),
        ));
  }
}

class IconSubmitButtonFillWidget extends StatelessWidget {
  const IconSubmitButtonFillWidget({
    required this.onTap,
    required this.text,
    required this.btnColor,
    required this.icon,
    this.textColor = ThemeColors.whiteColor,
    this.borderRadius = 4.0,
    this.textPadding = const EdgeInsets.all(8.0),
    this.isIconRight = false,
    this.iconColor = ThemeColors.whiteColor,
    this.borderRadiusDesign,
    super.key,
  });
  final String text;
  final Color btnColor;
  final Color textColor;
  final void Function() onTap;
  final double borderRadius;
  final EdgeInsetsGeometry textPadding;
  final bool isIconRight;
  final IconData icon;
  final Color iconColor;
  final BorderRadiusGeometry? borderRadiusDesign;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius:
                borderRadiusDesign ?? BorderRadius.circular(borderRadius),
          ),
          child: Padding(
            padding: textPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (!isIconRight)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CustomIcon(
                      icon: icon,
                      color: iconColor,
                    ),
                  ),
                CustomText(
                  writtenText: text,
                  textStyle: ThemeTextStyle.style(
                    color: textColor,
                  ),
                ),
                if (isIconRight)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CustomIcon(
                      icon: icon,
                      color: iconColor,
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}

class IconSubmitButtonUnFillWidget extends StatelessWidget {
  const IconSubmitButtonUnFillWidget({
    required this.onTap,
    required this.text,
    required this.btnColor,
    required this.icon,
    this.textColor = ThemeColors.whiteColor,
    this.borderRadius = 4.0,
    this.textPadding = const EdgeInsets.all(8.0),
    this.isIconRight = false,
    this.iconColor = ThemeColors.whiteColor,
    this.borderRadiusDesign,
    super.key,
  });
  final String text;
  final Color btnColor;
  final Color textColor;
  final void Function()? onTap;
  final double borderRadius;
  final EdgeInsetsGeometry textPadding;
  final bool isIconRight;
  final IconData icon;
  final Color iconColor;
  final BorderRadiusGeometry? borderRadiusDesign;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: ThemeColors.whiteColor,
            border: Border.all(
              color: btnColor,
            ),
            borderRadius:
                borderRadiusDesign ?? BorderRadius.circular(borderRadius),
          ),
          child: Padding(
            padding: textPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (!isIconRight)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CustomIcon(
                      icon: icon,
                      color: iconColor,
                    ),
                  ),
                CustomText(
                  writtenText: text,
                  textStyle: ThemeTextStyle.style(
                    color: textColor,
                  ),
                ),
                if (isIconRight)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CustomIcon(
                      icon: icon,
                      color: iconColor,
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
