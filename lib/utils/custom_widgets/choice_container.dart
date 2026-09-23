import 'package:flutter/material.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';

class ChoiceContainer extends StatelessWidget {
  final String text, image;
  const new({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 36, width: 36, child: Image.asset(image)),
              SizedBox(height: 4),
              CustomText(
                text: text,
                size: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
