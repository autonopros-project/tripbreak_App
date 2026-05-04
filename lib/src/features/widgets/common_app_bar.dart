
import '../../../common_imports.dart';
import '../../core/core/constants/constant_text.dart';
import '../../core/core/theme/colors.dart';
import '../../core/core/theme/style.dart';
import '../../core/core/utils/utils.dart';
import 'custom_text.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({required this.bodyWidget, super.key});
  final Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: ThemeColors.primaryColor,
            title: CustomText(
              writtenText: Constants.appName,
              textStyle: ThemeTextStyle.style(color: ThemeColors.whiteColor),
            ),
            iconTheme: const IconThemeData(color: ThemeColors.whiteColor),
          ),
          body: bodyWidget,
        );

  }
}
