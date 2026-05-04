
import '../../../common_imports.dart';
import '../../core/core/theme/colors.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final double topPadding;
  const CustomIcon({
    required this.icon,
    this.color = ThemeColors.blackColor,
    this.size = 24,
    this.topPadding = 0.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
