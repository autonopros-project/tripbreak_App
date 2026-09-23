import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/screens/trip_plan/trip_place.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_button.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';
import 'package:trip_break_final/utils/custom_widgets/underline_text.dart';

class CostContent extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Color(0xffF0F0F0),
                      child: Icon(LucideIcons.plane, color: Color(0xff666666)),
                    ),
                    SizedBox(width: 8),
                    CustomText(
                      text: 'Flights',
                      size: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    Spacer(),
                    UnderlineText(text: 'Know More'),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
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
                            size: 20,
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
                              CustomText(
                                text: 'Economy · 1 Adult',
                                size: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff8E8E93),
                              ),
                            ],
                          ),
                          Spacer(),
                          UnderlineText(text: 'Change'),
                        ],
                      ),
                      SizedBox(height: 8),
                      CustomText(
                        text: 'Best balance of price and arrival time',
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xffF0F0F0),
                          child: Icon(
                            LucideIcons.bed,
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
                        Spacer(),
                        UnderlineText(text: 'Know More'),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  'Tea County Resort and Punnamada Backwater Resort',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              CustomText(
                                text: '₹8,400',
                                size: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          CustomText(
                            text: 'Munnar · 2 Nights ; Alleppey · 2 Nights',
                            size: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff666666),
                          ),
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
                          SizedBox(height: 8),
                          CustomText(
                            text: 'Selected for location and comfort',
                            size: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xffF0F0F0),
                          child: Icon(
                            LucideIcons.coffee,
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
                        Spacer(),
                        UnderlineText(text: 'Know More'),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lunch 5 days',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
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
                          Divider(color: Color(0xffEBEBEB), thickness: 1),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dinner 4 days',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
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
                          Divider(color: Color(0xffEBEBEB), thickness: 1),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Best according to your preference',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Spacer(),
                              UnderlineText(text: 'Change'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xffF0F0F0),
                          child: Icon(
                            LucideIcons.sparkle,
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
                        Spacer(),
                        UnderlineText(text: 'Know More'),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Munnar Tea Estate Tour',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
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
                          Divider(color: Color(0xffEBEBEB), thickness: 2),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alleppey Backwater Cruise',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
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
                          Divider(color: Color(0xffEBEBEB), thickness: 2),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Matches your Nature preferences',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Spacer(),
                              UnderlineText(text: 'Change'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: CustomText(
                      text: 'Price Summary',
                      size: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
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
                                text: 'Food',
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
                          Divider(color: Color(0xffEBEBEB), thickness: 2),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Price',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              Spacer(),
                              CustomText(
                                text: '₹28,290',
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
              SizedBox(height: 24),
              SizedBox(
                width: 338,
                height: 49,
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
                          color: Color(0xff111827),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomButton(
          text: 'Book this trip',
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
