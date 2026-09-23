import 'package:flutter/material.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';
import 'package:trip_break_final/utils/trip_container.dart';

class PastTrips extends StatelessWidget {
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
              image: 'assets/images/rajasthan.png',
              place: 'Rajasthan',
              description: 'Jan 12 – Jan 17, 2026',
              date: 'Sep 12 – Sep 16, 2026',
              duration: '6 Days · 5 Nights',
              time: '✓ Completed',
              timeColor: Color(0xff0C8C00),
              progress: Color(0xff0C8C00),
            ),
            SizedBox(height: 16),
            TripContainer(
              image: 'assets/images/hp.png',
              place: 'Himachal Pradesh',
              description: 'Shimla → Manali',
              date: 'Dec 18 – Dec 23, 2025',
              duration: '5 Days · 4 Nights',
              time: '✓ Completed',
              timeColor: Color(0xff0C8C00),
              progress: Color(0xff0C8C00),
            ),
          ],
        ),
      ),
    );
  }
}
