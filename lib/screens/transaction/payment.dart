import 'package:flutter/material.dart';
import 'package:trip_break_final/screens/transaction/billing_invoice.dart';
import 'package:trip_break_final/utils/activity_widgets/payment_method.dart';
import 'package:trip_break_final/utils/activity_widgets/payment_option.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_button.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';

class Payment extends StatefulWidget {
  const new({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Payment',
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CustomText(
                          text: '₹28,290',
                          size: 36,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff00388C),
                        ),
                        CustomText(
                          text: 'Total trip cost',
                          size: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff767676),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    PaymentMethod(),
                    SizedBox(height: 16),
                    PaymentOption(),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        CustomText(
                          text: 'Have a promo code?',
                          size: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        Spacer(),
                        CustomText(
                          text: 'Add',
                          size: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff00388C),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  text: 'Trip cost',
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff767676),
                                ),
                                Spacer(),
                                CustomText(
                                  text: '₹26,150',
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                CustomText(
                                  text: 'Taxes & fees',
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff767676),
                                ),
                                Spacer(),
                                CustomText(
                                  text: '₹2,140',
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                CustomText(
                                  text: 'Total',
                                  size: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                                Spacer(),
                                CustomText(
                                  text: '₹28,290',
                                  size: 18,
                                  fontWeight: FontWeight.w700,
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
            ),
            CustomButton(
              text: 'Continue',
              voidCallback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BillingInvoice()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
