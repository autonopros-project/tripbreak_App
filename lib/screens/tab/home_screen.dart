import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/screens/trip_plan/plan_trip.dart';
import 'package:trip_break_final/utils/cover_destination.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';
import 'package:trip_break_final/utils/custom_widgets/helper.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Hi, John Cena!',
                          size: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        SizedBox(height: 4),
                        CustomText(
                          text: 'Welcome back',
                          size: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: FaIcon(
                        FontAwesomeIcons.bell,
                        color: Color(0xff00388C),
                      ),
                    ),
                    SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.settings_outlined,
                        color: Color(0xff00388C),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                CustomText(
                  text: 'YOUR NEXT ADVENTURE',
                  size: 11,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff6E6E73),
                ),
                SizedBox(height: 4),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(21),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/images/kerala.png',
                              width: double.infinity,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 8,
                              left: 10,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(21),
                                  color: Color(0xFFFFFFCC),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(LucideIcons.circleCheckBig, size: 13),
                                    SizedBox(width: 4),
                                    CustomText(
                                      text: 'Trip planned',
                                      size: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1D1D1F),
                                    ),
                                    Icon(LucideIcons.check, size: 15),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 12,
                              bottom: 10,
                              child: CustomText(
                                text: 'Kerala',
                                size: 32,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: '5 Days · 4 Nights',
                                  size: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff1D1D1F),
                                ),
                                SizedBox(height: 4),
                                CustomText(
                                  text: '12 Sep – 16 Sep',
                                  size: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff6E6E73),
                                ),
                              ],
                            ),
                            Container(
                              width: 165,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Color(0xffF4F6F8),
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: CustomText(
                                text: 'Kochi → Munnar → Alleppey',
                                size: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff00388C),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: SizedBox(
                            width: 338,
                            height: 49,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) => PlanTrip(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'View Trip',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff00388C),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(LucideIcons.arrowRight, size: 24),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: Color(0xffE1F5FE),
                          ),
                          child: Icon(
                            LucideIcons.cloudSun,
                            color: Color(0xff00388C),
                          ),
                        ),
                      ),
                      CustomText(
                        text: 'Kerala ',
                        size: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1D1D1F),
                      ),
                      CustomText(
                        text: '· 28°C ',
                        size: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1D1D1F),
                      ),
                      CustomText(
                        text: '· Partly cloudy',
                        size: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1D1D1F),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: Color(0xffE1F5FE),
                          ),
                          child: Icon(
                            LucideIcons.trendingDown,
                            color: Color(0xff10B981),
                          ),
                        ),
                      ),
                      CustomText(
                        text: 'Your Kerala flight dropped by',
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff1D1D1F),
                      ),
                      CustomText(
                        text: ' ₹1,200',
                        size: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff10B981),
                      ),
                      Spacer(),
                      Icon(
                        LucideIcons.bellRing600,
                        size: 14,
                        color: Color(0xff10B981),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Where do you want to go next?',
                      size: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1D1D1F),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          text: 'More',
                          size: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff00388C),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          LucideIcons.arrowRight,
                          size: 16,
                          color: const Color(0xff00388C),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CoverDestination(
                        image: 'assets/images/sunrise.png',
                        place: 'Goa',
                        description: 'Sunny Beaches, India',
                        price: '₹18,000',
                        rating: '4.8',
                      ),
                      SizedBox(width: 16),
                      CoverDestination(
                        image: 'assets/images/hawamahal.png',
                        place: 'Jaipur',
                        description: 'Hawa Mahal Palace, India',
                        price: '₹15,000',
                        rating: '4.9',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (builder) => PlanTrip()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '+',
                            style: TextStyle(
                              fontSize: 32,
                              color: Color(0xff00388C),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Create a Trip',
                            style: TextStyle(
                              fontSize: 20,
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
        ),
      ),
      floatingActionButton: Helper(),
    );
  }
}
