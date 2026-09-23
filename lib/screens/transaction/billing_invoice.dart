import 'package:flutter/material.dart';
import 'package:trip_break_final/screens/transaction/payment_success.dart';
import 'package:trip_break_final/utils/billing_details.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_button.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';

class BillingInvoice extends StatefulWidget {
  const new({super.key});

  @override
  State<BillingInvoice> createState() => _BillingInvoiceState();
}

class _BillingInvoiceState extends State<BillingInvoice> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Billing & Invoice',
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
                    CustomText(
                      text:
                          'Enter your billing details for the booking invoice.',
                      size: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6C6C6C),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BillingDetails(),
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: Color(0xffEBEBEB),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Business billing (optional)',
                              size: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff6C6C6C),
                            ),
                            SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: Colors.white,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hint: Text(
                                    'Add GSTIN (optional)',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffA0A0A0),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            CustomText(
                              text: 'Add your GSTIN if you need a business invoice.',
                              size: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffA0A0A0),
                            ),
                          ],
                        ),
                      ),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Invoice Preview',
                              size: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            SizedBox(height: 8),
                            CustomText(
                              text: 'Kerala, 5 Days / 4 Nights',
                              size: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6C6C6C),
                            ),
                            Divider(),
                            Row(
                              children: [
                                CustomText(
                                  text: 'Trip cost',
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff6C6C6C),
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
                                  text: 'Taxes and fees',
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff6C6C6C),
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
                            Divider(),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                CustomText(
                                  text: 'Total',
                                  size: 15,
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
                            SizedBox(height: 8),
                            CustomText(
                              text: 'Your invoice will be generated after payment is confirmed.',
                              size: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffA0A0A0),
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
              text: 'Review & Pay ₹ 28,290',
              voidCallback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentSuccess()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
