import 'package:flutter/material.dart';
import 'package:trip_break_final/screens/trip_plan/trip_creation.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_button.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';
import 'package:trip_break_final/utils/custom_widgets/helper.dart';

class TripSummary extends StatefulWidget {
  const new({super.key});

  @override
  State<TripSummary> createState() => _TripSummaryState();
}

class _TripSummaryState extends State<TripSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Trip Plan',
          size: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      CustomText(
                        text: '5 Days · 4 Nights',
                        size: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      SizedBox(height: 4),
                      CustomText(
                        text: ' Kochi → Munnar → Alleppey',
                        size: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff767676),
                      ),
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
                                  'assets/images/kerala.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: 'Kerala',
                                      size: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                    CustomText(
                                      text: "God's Own Country, at your own pace.",
                                      size: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: '01 · Kochi',
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            CustomText(
                              text: 'Fort Kochi → Chinese Fishing Nets → Mattancherry',
                              size: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff767676),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 1,
                                    height: 30,
                                    color: const Color(0xffBDBDBD),
                                  ),
                                  CustomText(
                                    text: "  🚙 130 km · ~4 hrs",
                                    size: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff767676),
                                  ),
                                ],
                              ),
                            ),
                            CustomText(
                              text: '02 · Munnar',
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            CustomText(
                              text: 'Tea Gardens → Eravikulam National Park → Sunset Point',
                              size: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff767676),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 1,
                                    height: 30,
                                    color: const Color(0xffBDBDBD),
                                  ),
                                  CustomText(
                                    text: "  🚙 165 km · ~4.5 hrs",
                                    size: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff767676),
                                  ),
                                ],
                              ),
                            ),
                            CustomText(
                              text: '03 · Alleppey',
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            CustomText(
                              text: 'Scenic drive → Backwater cruise → Houseboat stay',
                              size: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff767676),
                            ),
                            CustomText(
                              text: 'Estimated cost per person',
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Row(
                                children: [
                                  CustomText(
                                    text: '₹20,000 - ₹30,000 ',
                                    size: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  CustomText(
                                    text: '(Flights not included)',
                                    size: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff767676),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          CustomButton(
            text: 'Refine my trip',
            voidCallback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => TripCreation()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Helper(),
    );
  }
}
