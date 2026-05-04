
import '../../../common_imports.dart';
import '../../core/core/theme/colors.dart';

class CustomCheckboxField extends StatelessWidget {
  final bool value;
  final Widget labelWidget;
  final void Function(bool?)? onChanged;
  final OutlinedBorder? shape;
  final Color? activeColor;
  final Color? checkColor;

  const CustomCheckboxField({
    required this.value,
    required this.onChanged,
    required this.labelWidget,
    this.activeColor = ThemeColors.greenColor,
    this.checkColor = ThemeColors.greyColor,
    this.shape,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Checkbox(
            shape: shape ??
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
            activeColor: activeColor,
            checkColor: checkColor,
            value: value,
            onChanged: onChanged,
          ),
          labelWidget,
        ],
      );
}
