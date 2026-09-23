import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/utils/category_card.dart';
import 'package:trip_break_final/utils/activity_widgets/cost_content.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';
import 'package:trip_break_final/utils/activity_widgets/itinerary_content.dart';
import 'package:trip_break_final/utils/activity_widgets/sliding_feature.dart';

class PlanYourTrip extends StatefulWidget {
  const new({super.key});

  @override
  State<PlanYourTrip> createState() => _PlanYourTripState();
}

class _PlanYourTripState extends State<PlanYourTrip> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Planning your trip',
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(21),
                    child: Stack(
                      children: [
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                          ),
                          child: Image.asset(
                            'assets/images/tea_garden.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: 'Kerala',
                                  size: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: '5 Days · 4 Nights  |  ',
                                      size: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                    CustomText(
                                      text: '12 Sep – 16 Sep · 2 Travellers',
                                      size: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffEBEBEB),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12),
                        CustomText(
                          text: 'ROUTE',
                          size: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff767676),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Kochi',
                                  size: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                CustomText(
                                  text: 'Start Trip',
                                  size: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff767676),
                                ),
                              ],
                            ),
                            Icon(
                              LucideIcons.arrowRight,
                              color: Color(0xff767676),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Munnar',
                                  size: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                CustomText(
                                  text: 'Hill Station',
                                  size: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff767676),
                                ),
                              ],
                            ),
                            Icon(
                              LucideIcons.arrowRight,
                              color: Color(0xff767676),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Alleppey',
                                  size: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                CustomText(
                                  text: 'Backwaters',
                                  size: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff767676),
                                ),
                              ],
                            ),
                          ],
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
                  child: Row(
                    children: [
                      CategoryCard(emoji: '🌴', title: 'Relaxation'),
                      SizedBox(width: 8),
                      CategoryCard(emoji: '🌿', title: 'Nature'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: '₹28,290',
                            size: 26,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff1A1A1A),
                          ),
                          CustomText(
                            text: 'Estimated trip cost for 2 persons',
                            size: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff767676),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Color(0xF5C51880).withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                LucideIcons.sparkles,
                                color: Color(0xff1A1A1A),
                                size: 18,
                              ),
                              SizedBox(width: 4),
                              CustomText(
                                text: 'Why this plan?',
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1A1A1A),
                              ),
                            ],
                          ),
                          CustomText(
                            text: 'Built around your Balanced budget and Nature + Relaxation preferences.',
                            size: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff767676),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SlidingFeature(
                    onValueChanged: (index) {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                    text1: 'Itinerary',
                    text2: 'Cost',
                    height: 40,
                  ),
                ),
                selectedTab == 0 ? ItineraryContent() : CostContent(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
