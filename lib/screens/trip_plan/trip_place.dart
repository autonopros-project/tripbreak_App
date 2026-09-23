import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/screens/trip_plan/your_route.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_button.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';

class TripPlace extends StatefulWidget {
  const new({super.key});

  @override
  State<TripPlace> createState() => _TripPlaceState();
}

class _TripPlaceState extends State<TripPlace> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Trip Place',
          size: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
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
                          text: 'Eravikulam National Park',
                          size: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        CustomText(
                          text: 'Munnar',
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
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(21),
                                  ),
                                  child: Image.asset('assets/images/park.jpg'),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 0,
                                  right: 0,
                                  child: Column(
                                    children: [
                                      CustomText(
                                        text: 'Eravikulam National Park',
                                        size: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                      CustomText(
                                        text: '📍Munnar | ⭐4.6 | 🌿Nature',
                                        size: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Icon(
                                    Icons.favorite,
                                    color: Color(0xffFF0000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Why this place?',
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              CustomText(
                                text: 'Recommended because it matches your Nature preference and fits naturally into your Munnar route. Near your hotel & highly rated for families',
                                size: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676),
                              ),
                              SizedBox(height: 8),
                              CustomText(
                                text: 'Duration',
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              CustomText(
                                text: '2-3 hrs',
                                size: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676),
                              ),
                              SizedBox(height: 8),
                              CustomText(
                                text: 'Entry fee',
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              CustomText(
                                text: '₹200',
                                size: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676),
                              ),
                              SizedBox(height: 8),
                              CustomText(
                                text: 'Opening hours',
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              CustomText(
                                text: '08:00–16:00',
                                size: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676),
                              ),
                              SizedBox(height: 8),
                              CustomText(
                                text: 'Best time',
                                size: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              CustomText(
                                text: 'Morning & Evening',
                                size: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676),
                              ),
                              SizedBox(height: 8),
                              CustomText(
                                text: 'Things to do',
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              CustomText(
                                text: '• Explore the park\n• Scenic viewpoints\n• Spot Nilgiri Tahr',
                                size: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: 338,
                      height: 49,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff00388C)),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => YourRoute(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF3F4F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(LucideIcons.plus, size: 24),
                            SizedBox(width: 8),
                            Text(
                              'Save/ Share this trip',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: Color(0xff00388C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              text: 'Confirm',
              voidCallback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YourRoute()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
