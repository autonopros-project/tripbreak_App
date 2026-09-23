import 'package:flutter/material.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';

class ActivityContainer extends StatelessWidget {
  final String activity, description;
  const new({super.key, required this.activity, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              CircleAvatar(radius: 4, backgroundColor: Color(0xffF5C518)),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: activity,
                    size: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1A1A1A),
                  ),
                  CustomText(
                    text: description,
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff767676),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
