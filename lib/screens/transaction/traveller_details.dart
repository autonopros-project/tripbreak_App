import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/screens/transaction/payment.dart';
import 'package:trip_break_final/utils/activity_widgets/contact_details.dart';
import 'package:trip_break_final/utils/activity_widgets/preferences_container.dart';
import 'package:trip_break_final/utils/activity_widgets/primary_traveller.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_button.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';

class TravellerDetails extends StatefulWidget {
  const new({super.key});

  @override
  State<TravellerDetails> createState() => _TravellerDetailsState();
}

class _TravellerDetailsState extends State<TravellerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Traveller details',
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
                  PrimaryTraveler(),
                  SizedBox(height: 16),
                  ContactDetails(),
                  SizedBox(height: 16),
                  PreferencesContainer(),
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: double.infinity,
                      height: 49,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff00388C)),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (builder) => Payment()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF3F4F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              LucideIcons.plus,
                              size: 24,
                              color: Color(0xff00388C),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Add passenger',
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
              text: 'Continue',
              voidCallback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => Payment()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
