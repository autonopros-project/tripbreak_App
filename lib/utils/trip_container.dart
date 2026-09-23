import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';

class TripContainer extends StatelessWidget {
  final String place, description, date, duration, time, image;
  final Color timeColor, progress;
  const new({
    super.key,
    required this.image,
    required this.place,
    required this.description,
    required this.date,
    required this.duration,
    required this.time,
    required this.timeColor,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 132,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            border: Border.all(color: Color(0xffEBEBEB)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(21),
                  child: Image.asset(image, width: 130),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: place,
                      size: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    CustomText(
                      text: description,
                      size: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff84818C),
                    ),
                    CustomText(
                      text: date,
                      size: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    CustomText(
                      text: duration,
                      size: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff84818C),
                    ),
                    CustomText(
                      text: time,
                      size: 15,
                      fontWeight: FontWeight.w700,
                      color: timeColor,
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    Icon(
                      LucideIcons.squareArrowRight,
                      color: Color(0xff00388C),
                    ),
                    Spacer(),
                    CircleAvatar(radius: 7, backgroundColor: Color(0xffFF8800)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
