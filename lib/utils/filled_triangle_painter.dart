import 'package:flutter/material.dart';

class FilledTrianglePainter extends CustomPainter {
  final Color color;

  FilledTrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant FilledTrianglePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
