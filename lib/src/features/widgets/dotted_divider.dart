
import '../../../common_imports.dart';
import '../../core/core/theme/colors.dart';
import '../../core/core/utils/enums.dart';

class DottedDivider extends StatelessWidget {
  const DottedDivider({
    this.dividerType = DividerType.normal,
    super.key,
    this.strokeWidth = 1.0,
    this.dashWidth = 2.0,
    this.gapWidth = 2.0,
    this.color = ThemeColors.greyColor,
  });

  final double strokeWidth;
  final double dashWidth;
  final double gapWidth;
  final Color color;
  final DividerType dividerType;

  @override
  Widget build(BuildContext context) {
    if (dividerType == DividerType.horizontal) {
      return HorizontalDottedDivider(
        strokeWidth: strokeWidth,
        dashWidth: dashWidth,
        gapWidth: gapWidth,
        color: color,
      );
    }
    if (dividerType == DividerType.vertical) {
      return VerticalDottedDivider(
        strokeWidth: strokeWidth,
        dashHeight: dashWidth,
        gapWidth: gapWidth,
        color: color,
      );
    }
    return Divider(
      color: color,
      thickness: strokeWidth - 0.4,
    );
  }
}

class HorizontalDottedDivider extends StatelessWidget {
  final double strokeWidth;
  final double dashWidth;
  final double gapWidth;
  final Color color;

  const HorizontalDottedDivider(
      {super.key,
      this.strokeWidth = 1.0,
      this.dashWidth = 2.0,
      this.gapWidth = 2.0,
      this.color = ThemeColors.greyColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: CustomPaint(
        painter: HorizontalDottedLinePainter(
          strokeWidth: strokeWidth,
          dashWidth: dashWidth,
          gapWidth: gapWidth,
          color: color,
          // color: color ?? Theme.of(context).dividerColor,
        ),
        child: Container(
          height: strokeWidth,
        ),
      ),
    );
  }
}

class VerticalDottedDivider extends StatelessWidget {
  final double strokeWidth;
  final double dashHeight;
  final double gapWidth;
  final Color color;

  const VerticalDottedDivider({
    super.key,
    this.strokeWidth = 1.0,
    this.dashHeight = 2.0,
    this.gapWidth = 2.0,
    this.color = ThemeColors.greyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: CustomPaint(
        painter: VerticalDottedLinePainter(
          strokeWidth: strokeWidth,
          dashHeight: dashHeight,
          gapWidth: gapWidth,
          color: color,
        ),
        child: Container(
          width: strokeWidth, // Adjusted for vertical orientation
        ),
      ),
    );
  }
}

class HorizontalDottedLinePainter extends CustomPainter {
  final double strokeWidth;
  final double dashWidth;
  final double gapWidth;
  final Color color;

  HorizontalDottedLinePainter(
      {required this.strokeWidth,
      required this.dashWidth,
      required this.gapWidth,
      required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    final double dashWidth = gapWidth;
    final double dashSpace = dashWidth;

    double startY = 0.0;
    double currentX = 0.0;
    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, startY),
        Offset(currentX + dashWidth, startY),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class VerticalDottedLinePainter extends CustomPainter {
  final double strokeWidth;
  final double dashHeight;
  final double gapWidth;
  final Color color;

  VerticalDottedLinePainter({
    required this.strokeWidth,
    required this.dashHeight,
    required this.gapWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double currentY = 0.0;
    while (currentY < size.height) {
      canvas.drawLine(
        Offset(0.0, currentY),
        Offset(0.0, currentY + dashHeight),
        paint,
      );
      currentY += dashHeight + gapWidth;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
