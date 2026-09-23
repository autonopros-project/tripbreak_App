import 'package:flutter/material.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';

class ProfileContainer2 extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback action;
  const new({super.key, required this.title, required this.icon, required this.action});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            border: Border.all(color: Color(0xffEBEBEB)),
          ),
          child: Row(
            children: [
              Icon(icon, color: Color(0xff00388C)),
              SizedBox(width: 16),
              CustomText(
                text: title,
                size: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              Spacer(),
              Icon(Icons.keyboard_arrow_right, size: 30, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
