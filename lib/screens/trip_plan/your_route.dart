import 'package:flutter/material.dart';
import 'package:trip_break_final/screens/trip_plan/day_route.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_button.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';
import 'package:trip_break_final/utils/activity_widgets/day_summary.dart';

class YourRoute extends StatefulWidget {
  const new({super.key});

  @override
  State<YourRoute> createState() => _YourRouteState();
}

class _YourRouteState extends State<YourRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'Your route',
          size: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 8),
                        CustomText(
                          text: 'Kochi → Munnar → Alleppey → Kochi',
                          size: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        CustomText(
                          text: 'Kerala',
                          size: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff767676),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(21),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(21),
                              ),
                              child: Image.asset('assets/images/map.png'),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  DaySummary(
                    day: 'Day 1',
                    place: 'Kochi',
                    title1: 'Arrive in Kochi',
                    subtitle1: 'Cochin Airport . Pickup',
                    title2: 'Fort Kochi',
                    subtitle2: 'Heritage walk . 2 hrs',
                    title3: 'Lunch',
                    subtitle3: 'kashi Art Cafe',
                    title4: 'Mattancherry',
                    subtitle4: 'Palace & spice lanes',
                  ),
                  DaySummary(
                    day: 'Day 2',
                    place: 'Kochi → Munnar',
                    title1: 'Arrive in Munnar',
                    subtitle1: 'Cochin Airport . Pickup',
                    title2: 'Eravikulam National Park',
                    subtitle2: 'Guided estate walk',
                    title3: 'Lunch',
                    subtitle3: 'kashi Art Cafe',
                    title4: 'Sunset Point',
                    subtitle4: 'Pothamedu viewpoint',
                  ),
                  DaySummary(
                    day: 'Day 3',
                    place: 'Munnar',
                    title1: 'Arrive in Kochi',
                    subtitle1: 'Cochin Airport . Pickup',
                    title2: 'Fort Kochi',
                    subtitle2: 'Heritage walk . 2 hrs',
                    title3: 'Lunch',
                    subtitle3: 'kashi Art Cafe',
                    title4: 'Mattancherry',
                    subtitle4: 'Palace & spice lanes',
                  ),
                  DaySummary(
                    day: 'Day 4',
                    place: 'Munnar → Alleppey',
                    title1: 'Arrive in Alleppey',
                    subtitle1: 'Cochin Airport . Pickup',
                    title2: 'Fort Kochi',
                    subtitle2: 'Heritage walk . 2 hrs',
                    title3: 'Lunch',
                    subtitle3: 'kashi Art Cafe',
                    title4: 'Mattancherry',
                    subtitle4: 'Palace & spice lanes',
                  ),
                  DaySummary(
                    day: 'Day 5',
                    place: 'Alleppey → Kochi',
                    title1: 'Arrive in Kochi',
                    subtitle1: 'Cochin Airport . Pickup',
                    title2: 'Fort Kochi',
                    subtitle2: 'Heritage walk . 2 hrs',
                    title3: 'Lunch',
                    subtitle3: 'kashi Art Cafe',
                    title4: 'Mattancherry',
                    subtitle4: 'Palace & spice lanes',
                  ),
                ],
              ),
            ),
            CustomButton(
              text: 'Confirm',
              voidCallback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DayRoute()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
