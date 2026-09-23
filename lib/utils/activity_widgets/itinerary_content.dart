import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/screens/trip_plan/trip_place.dart';
import 'package:trip_break_final/utils/activity_widgets/activity_container.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_button.dart';

class ItineraryContent extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActivityContainer(
          activity: 'Day 1 · Kochi',
          description: 'Arrival, Fort Kochi & Kathakali show',
        ),
        ActivityContainer(
          activity: 'Day 2 · Kochi to Munnar',
          description: 'Drive to tea hills, waterfalls',
        ),
        ActivityContainer(
          activity: 'Day 3 · Munnar',
          description: 'Houseboat cruise, scenic backwaters',
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => TripPlace()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF5C518),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LucideIcons.map, color: Color(0xff00388C)),
                  SizedBox(width: 8),
                  Text(
                    'Map',
                    style: TextStyle(fontSize: 20, color: Color(0xff00388C)),
                  ),
                ],
              ),
            ),
          ),
        ),
        CustomButton(
          text: 'Next',
          voidCallback: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TripPlace()),
            );
          },
        ),
      ],
    );
  }
}
