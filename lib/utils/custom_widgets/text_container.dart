import 'package:flutter/material.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';

class TextContainer extends StatelessWidget {
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomText(
            text: text,
            size: size,
            fontWeight: fontWeight,
            color: color,
          ),
        ),
      ),
    );
  }
}
