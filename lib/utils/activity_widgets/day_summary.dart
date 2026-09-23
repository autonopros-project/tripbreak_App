import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/utils/activity_widgets/day_summary_container.dart';

class DaySummary extends StatelessWidget {
  final String day,
      place,
      title1,
      title2,
      title3,
      title4,
      subtitle1,
      subtitle2,
      subtitle3,
      subtitle4;
  const DaySummary({
    super.key,
    required this.day,
    required this.place,
    required this.title1,
    required this.subtitle1,
    required this.title2,
    required this.subtitle2,
    required this.title3,
    required this.subtitle3,
    required this.title4,
    required this.subtitle4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    place,
                    style: TextStyle(fontSize: 13, color: Color(0xff767676)),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      LucideIcons.sparkles,
                      size: 12,
                      color: Color(0xffF5C518),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Optimize',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          DaySummaryContainer(
            time: '10:00',
            icon: LucideIcons.car,
            title: title1,
            subtitle: subtitle1,
            isFirst: true,
            isLast: false,
          ),
          DaySummaryContainer(
            time: '12:00',
            icon: LucideIcons.mapPin,
            title: title2,
            subtitle: subtitle2,
            isFirst: false,
            isLast: false,
          ),
          DaySummaryContainer(
            time: '14:00',
            icon: LucideIcons.utensils,
            title: title3,
            subtitle: subtitle3,
            isFirst: false,
            isLast: false,
          ),
          DaySummaryContainer(
            time: '17:00',
            icon: LucideIcons.mapPin,
            title: title4,
            subtitle: subtitle4,
            isFirst: false,
            isLast: true,
          ),
        ],
      ),
    );
  }
}
