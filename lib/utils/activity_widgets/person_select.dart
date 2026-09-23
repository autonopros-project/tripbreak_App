import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';

class PersonSelect extends StatefulWidget {
  final String tag, age;
  const new({super.key, required this.tag, required this.age});

  @override
  State<PersonSelect> createState() => _PersonSelectState();
}

class _PersonSelectState extends State<PersonSelect> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 68,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: widget.tag,
                  size: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                CustomText(
                  text: widget.age,
                  size: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff767676),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                count > 0 ? count-- : count;
              });
            },
            child: Icon(
              LucideIcons.circleMinus,
              size: 20,
              color: const Color(0xff00388C),
            ),
          ),
          SizedBox(width: 12),
          CustomText(
            text: '$count',
            size: 18,
            fontWeight: FontWeight.w400,
            color: const Color(0xff1D1D1F),
          ),
          SizedBox(width: 12),
          InkWell(
            onTap: () {
              setState(() {
                count++;
              });
            },
            child: Icon(
              LucideIcons.circlePlus,
              size: 20,
              color: const Color(0xff00388C),
            ),
          ),
        ],
      ),
    );
  }
}
