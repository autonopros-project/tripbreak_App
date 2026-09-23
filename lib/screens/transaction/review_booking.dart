import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/screens/transaction/traveller_details.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_button.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';
import 'package:trip_break_final/utils/custom_widgets/underline_text.dart';

class ReviewBooking extends StatefulWidget {
  const new({super.key});

  @override
  State<ReviewBooking> createState() => _ReviewBookingState();
}

class _ReviewBookingState extends State<ReviewBooking> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Review your trip',
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
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Kerala',
                            size: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          SizedBox(height: 4),
                          CustomText(
                            text: '5 Days · 4 Nights',
                            size: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff666666),
                          ),
                          SizedBox(height: 4),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: Color(0xffF5F5F5),
                            ),
                            child: CustomText(
                              text: 'Kochi → Munnar → Alleppey',
                              size: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff00388C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: Color(0xffF0F0F0),
                        child: Icon(
                          LucideIcons.plane,
                          size: 20,
                          color: Color(0xff666666),
                        ),
                      ),
                      SizedBox(width: 8),
                      CustomText(
                        text: 'Flights',
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                text: 'Delhi',
                                size: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              SizedBox(width: 8),
                              Icon(
                                LucideIcons.arrowRight,
                                color: Color(0xff666666),
                              ),
                              SizedBox(width: 8),
                              CustomText(
                                text: 'Kochi',
                                size: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              Spacer(),
                              CustomText(
                                text: '₹6,850',
                                size: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'IndiGo · 06:15 → 09:15',
                                    size: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff666666),
                                  ),
                                  SizedBox(height: 4),
                                  CustomText(
                                    text: 'Economy · 1 Adult',
                                    size: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff8E8E93),
                                  ),
                                ],
                              ),
                              Spacer(),
                              UnderlineText(text: 'Change'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: Color(0xffF0F0F0),
                        child: Icon(
                          LucideIcons.coffee,
                          size: 20,
                          color: Color(0xff666666),
                        ),
                      ),
                      SizedBox(width: 8),
                      CustomText(
                        text: 'Food',
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                text: 'Lunch 5 days',
                                size: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              Spacer(),
                              CustomText(
                                text: '₹1,140',
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Divider(color: Color(0xffEBEBEB)),
                          Row(
                            children: [
                              CustomText(
                                text: 'Dinner 4 days',
                                size: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              Spacer(),
                              CustomText(
                                text: '₹1,000',
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Divider(color: Color(0xffEBEBEB)),
                          Row(
                            children: [
                              Spacer(),
                              UnderlineText(text: 'Change'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: Color(0xffF0F0F0),
                        child: Icon(
                          LucideIcons.bed,
                          size: 20,
                          color: Color(0xff666666),
                        ),
                      ),
                      SizedBox(width: 8),
                      CustomText(
                        text: 'Stays',
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Tea County Resort',
                                    size: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  CustomText(
                                    text: 'Munnar · 2 Nights',
                                    size: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff666666),
                                  ),
                                ],
                              ),
                              Spacer(),
                              CustomText(
                                text: '₹8,400',
                                size: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              CustomText(
                                text: 'Deluxe Room · Breakfast included',
                                size: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff8E8E93),
                              ),
                              Spacer(),
                              UnderlineText(text: 'Change'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Punnamada Backwater Resort',
                                    size: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  CustomText(
                                    text: 'Alleppey · 2 Nights',
                                    size: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff666666),
                                  ),
                                ],
                              ),
                              Spacer(),
                              CustomText(
                                text: '₹7,200',
                                size: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              CustomText(
                                text: 'Lake View Room',
                                size: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff8E8E93),
                              ),
                              Spacer(),
                              UnderlineText(text: 'Change'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: Color(0xffF0F0F0),
                        child: Icon(
                          LucideIcons.sparkle,
                          size: 20,
                          color: Color(0xff666666),
                        ),
                      ),
                      SizedBox(width: 8),
                      CustomText(
                        text: 'Experiences',
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                text: 'Munnar Tea Estate Tour',
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              Spacer(),
                              CustomText(
                                text: '₹1,200',
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Divider(color: Color(0xffEBEBEB)),
                          Row(
                            children: [
                              CustomText(
                                text: 'Alleppey Backwater Cruise',
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              Spacer(),
                              CustomText(
                                text: '₹2,500',
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Divider(color: Color(0xffEBEBEB)),
                          Row(
                            children: [
                              UnderlineText(text: '+ 2 more experiences'),
                              Spacer(),
                              CustomText(
                                text: 'Included in plan',
                                size: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff8E8E93),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  CustomText(
                    text: 'Price Summary',
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                text: 'Flights',
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff666666),
                              ),
                              Spacer(),
                              CustomText(
                                text: '₹6,850',
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: 'Hotels',
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff666666),
                              ),
                              Spacer(),
                              CustomText(
                                text: '₹15,600',
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: 'Experiences',
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff666666),
                              ),
                              Spacer(),
                              CustomText(
                                text: '₹3,700',
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: 'Subtotal',
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff666666),
                              ),
                              Spacer(),
                              CustomText(
                                text: '₹26,150',
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: 'Taxes & fees',
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff666666),
                              ),
                              Spacer(),
                              CustomText(
                                text: '₹2,140',
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Divider(color: Color(0xffEBEBEB)),
                          Row(
                            children: [
                              CustomText(
                                text: 'Total Price',
                                size: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                              Spacer(),
                              CustomText(
                                text: '₹22,290',
                                size: 22,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff00388C),
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
            CustomButton(
              text: 'Next',
              voidCallback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TravellerDetails()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
