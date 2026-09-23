import 'package:flutter/material.dart';
import 'package:trip_break_final/screens/trip_plan/plan_your_trip.dart';
import 'package:trip_break_final/utils/custom_widgets/choice_container.dart';
import 'package:trip_break_final/utils/colorful_container.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_button.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';
import 'package:trip_break_final/utils/category_card.dart';
import 'package:trip_break_final/utils/custom_widgets/helper.dart';
import 'package:trip_break_final/utils/custom_widgets/text_container.dart';
import 'package:trip_break_final/utils/filled_triangle_painter.dart';

class TripCreation extends StatefulWidget {
  const new({super.key});

  @override
  State<TripCreation> createState() => _TripCreationState();
}

class _TripCreationState extends State<TripCreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Trip Creation',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Select your plan',
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  ColorfulContainer(
                    budget: 'Budget',
                    feature: 'Smart & affordable',
                    price: '₹15K–₹25K',
                    color1: Color(0xFF6A00CC),
                    color2: Color(0xffFFCC00),
                  ),
                  SizedBox(height: 8),
                  ColorfulContainer(
                    budget: 'Balanced',
                    feature: 'Comfort + value',
                    price: '₹25K–₹40K',
                    color1: Color(0xFF00D919),
                    color2: Color(0xff82B4FF),
                  ),
                  SizedBox(height: 8),
                  ColorfulContainer(
                    budget: 'Premium',
                    feature: 'More comfort & experiences',
                    price: '₹40K+',
                    color1: Color(0xff8F4EFF),
                    color2: Color(0xffC67CFF),
                  ),
                  SizedBox(height: 16),
                  CustomText(
                    text: 'What do you want more of?',
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 4,
                    runSpacing: 8,
                    children: [
                      CategoryCard(emoji: '🏝️', title: 'Beach'),
                      CategoryCard(emoji: '🏔️', title: 'Adventure'),
                      CategoryCard(emoji: '🍜', title: 'Food'),
                      CategoryCard(emoji: '🌴', title: 'Relaxation'),
                      CategoryCard(emoji: '🌙', title: 'Nightlife'),
                      CategoryCard(emoji: '🌿', title: 'Nature'),
                      CategoryCard(emoji: '👨‍👩‍👧', title: 'Family'),
                      CategoryCard(emoji: '🏛️', title: 'Culture'),
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomText(
                    text: 'Where would you like to stay?',
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ChoiceContainer(
                          text: 'Hotel',
                          image: 'assets/images/hotel.png',
                        ),
                        ChoiceContainer(
                          text: 'Homestay',
                          image: 'assets/images/home_stay.png',
                        ),
                        ChoiceContainer(
                          text: 'Hostel',
                          image: 'assets/images/hotel.png',
                        ),
                        ChoiceContainer(
                          text: 'Resort',
                          image: 'assets/images/resort.png',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  CustomText(
                    text: 'Trip Vibe',
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  TextContainer(
                    text: 'Slow & peaceful',
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  TextContainer(
                    text: 'Explore everything',
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  TextContainer(
                    text: 'Scenic & romantic',
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  SizedBox(height: 16),
                  CustomText(
                    text: 'Mode of Travel',
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  TextContainer(
                    text: '🚂 Train',
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  TextContainer(
                    text: '✈️ Flight',
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  TextContainer(
                    text: '🚌 Bus',
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  SizedBox(height: 16),
                  CustomText(
                    text: 'Food',
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xff1AB35E),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Color(0xff1AB35E),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 4),
                                  CustomText(
                                    text: 'Vegetarian',
                                    size: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xffFF0D0D),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Center(
                                          child: CustomPaint(
                                            size: Size(8, 8),
                                            painter: FilledTrianglePainter(
                                              color: Color(0xffFF0D0D),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 4),
                                  CustomText(
                                    text: 'Non Vegetarian',
                                    size: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xffE8A33D),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Color(0xffE8A33D),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 4),
                                  CustomText(
                                    text: 'Eggetarian',
                                    size: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  CustomText(
                    text: 'Activity Level',
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      CategoryCard(emoji: '🧘‍♂️', title: 'Relaxed'),
                      SizedBox(width: 8),
                      CategoryCard(emoji: '🚶', title: 'Balanced'),
                      SizedBox(width: 8),
                      CategoryCard(emoji: '🏃', title: 'Packed'),
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(
              text: 'Next',
              voidCallback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlanYourTrip()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Helper(),
    );
  }
}
