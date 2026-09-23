import 'package:flutter/material.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';

class ColorfulContainer extends StatelessWidget {
  final String budget, feature, price;
  final Color color1, color2;
  const new({
    super.key,
    required this.budget,
    required this.feature,
    required this.price,
    required this.color1,
    required this.color2
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        gradient: LinearGradient(
          colors: [color1, color2],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: budget,
                    size: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffF5FCFF),
                  ),
                  SizedBox(height: 2),
                  CustomText(
                    text: feature,
                    size: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            CustomText(
              text: price,
              size: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xffF5FCFF),
            ),
          ],
        ),
      ),
    );
  }
}
