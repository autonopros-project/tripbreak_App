import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/screens/tab/main_navigation.dart';
import 'package:trip_break_final/utils/activity_widgets/sliding_feature.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';
import 'package:trip_break_final/utils/past_trips.dart';
import 'package:trip_break_final/utils/upcoming_trips.dart';

class MyTrip extends StatefulWidget {
  const new({super.key});

  @override
  State<MyTrip> createState() => _MyTripState();
}

class _MyTripState extends State<MyTrip> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'My Trips',
          size: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainNavigation()),
            );
          },
          child: Icon(LucideIcons.arrowLeft),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: FaIcon(FontAwesomeIcons.bell, color: Color(0xff00388C)),
          ),
          SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.settings_outlined, color: Color(0xff00388C)),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SlidingFeature(
              onValueChanged: (index) {
                setState(() {
                  selectedTab = index;
                });
              },
              text1: 'Upcoming trips',
              text2: 'Past trips',
              height: 69,
              icon1: Icons.event_available,
              icon2: LucideIcons.calendarCheck,
            ),
          ),
          selectedTab == 0 ? UpcomingTrips() : PastTrips(),
        ],
      ),
    );
  }
}
