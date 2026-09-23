import 'package:flutter/material.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';
import 'package:trip_break_final/utils/trip_container.dart';

class UpcomingTrips extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            CustomText(
              text: 'Upcoming trips',
              size: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            SizedBox(height: 16),
            TripContainer(
              image: 'assets/images/keral.png',
              place: 'Kerala',
              description: 'Kochi → Munnar → Alleppey',
              date: 'Sep 12 – Sep 16, 2026',
              duration: '5 Days · 4 Nights',
              time: 'Starts in 12 days',
              timeColor: Color(0xff00388C),
              progress: Color(0xffFF8800),
            ),
            SizedBox(height: 16),
            TripContainer(
              image: 'assets/images/goa.png',
              place: 'Goa',
              description: 'North Goa → Panjim',
              date: 'Oct 04 – Oct 08, 2026',
              duration: '5 Days · 4 Nights',
              time: 'Confirmed',
              timeColor: Color(0xff00388C),
              progress: Color(0xff44FF00),
            ),
          ],
        ),
      ),
    );
  }
}
