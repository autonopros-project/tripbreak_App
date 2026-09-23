import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  const new({
    super.key,
    required this.text,
    required this.size,
    required this.fontWeight,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight),
    );
  }
}
