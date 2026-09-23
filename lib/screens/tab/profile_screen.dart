import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/screens/authentication/login_screen.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';
import 'package:trip_break_final/utils/profile_container.dart';
import 'package:trip_break_final/utils/profile_container2.dart';

class ProfileScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset('assets/images/profile.png'),
                        ),
                        CustomText(
                          text: 'John Cena',
                          size: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        CustomText(
                          text: 'johncena@gmail.com',
                          size: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff84818C),
                        ),
                      ],
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFFCC00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Color(0xff00388C),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CustomText(
                          text: '4',
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff00388C),
                        ),
                        CustomText(
                          text: 'Trips',
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Image.asset('assets/images/divider.png'),
                    Column(
                      children: [
                        CustomText(
                          text: '12',
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff00388C),
                        ),
                        CustomText(
                          text: 'Saved Places',
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Image.asset('assets/images/divider.png'),
                    Column(
                      children: [
                        CustomText(
                          text: '3',
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff00388C),
                        ),
                        CustomText(
                          text: 'Countries',
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Your travel',
                      size: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8),
                    ProfileContainer(
                      title: 'Saved',
                      description: 'Destinations & experiences',
                      icon: LucideIcons.heart,
                      action: () {},
                    ),
                    ProfileContainer(
                      title: 'My Trips',
                      description: 'Upcoming & past trips',
                      icon: LucideIcons.briefcaseBusiness,
                      action: () {},
                    ),
                    ProfileContainer(
                      title: 'Travel Documents',
                      description: 'Tickets, vouchers & receipts',
                      icon: LucideIcons.layers,
                      action: () {},
                    ),
                    ProfileContainer(
                      title: 'Payment & Billing',
                      description: 'Payment methods & invoices',
                      icon: LucideIcons.globe,
                      action: () {},
                    ),
                    ProfileContainer(
                      title: 'Notifications & Alerts',
                      description: 'Updates, price alerts & AI suggestions',
                      icon: LucideIcons.bell,
                      action: () {},
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Other',
                      size: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8),
                    ProfileContainer2(
                      title: 'Settings',
                      icon: LucideIcons.settings,
                      action: () {},
                    ),
                    ProfileContainer2(
                      title: 'Support / Help Center',
                      icon: LucideIcons.circleQuestionMark,
                      action: () {},
                    ),
                    ProfileContainer2(
                      title: 'Log out',
                      icon: LucideIcons.logOut,
                      action: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
