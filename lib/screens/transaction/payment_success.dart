import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/screens/transaction/payment_failed.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_button.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';

class PaymentSuccess extends StatefulWidget {
  const new({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Payment Success',
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
            child: Center(
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
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Color(0xff0CC3521A),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Color(0xff0CC352),
                              child: Icon(
                                LucideIcons.check,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          CustomText(
                            text: 'Payment successful',
                            size: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          CustomText(
                            text: 'Successfully paid   ₹28,290.00',
                            size: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Color(0xffFAFAFA),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          CustomText(
                            text: 'Transaction details',
                            size: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              CustomText(
                                text: 'Transaction ID',
                                size: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff767676),
                              ),
                              Spacer(),
                              CustomText(
                                text: '123456789012',
                                size: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              CustomText(
                                text: 'Date',
                                size: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff767676),
                              ),
                              Spacer(),
                              CustomText(
                                text: '08:25 | 10 Aug 2026',
                                size: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              CustomText(
                                text: 'Type of Transaction',
                                size: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff767676),
                              ),
                              Spacer(),
                              CustomText(
                                text: 'Credit Card',
                                size: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              CustomText(
                                text: 'Amount Paid',
                                size: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff767676),
                              ),
                              Spacer(),
                              CustomText(
                                text: ' ₹28,290.00',
                                size: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              CustomText(
                                text: 'Status',
                                size: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff767676),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    LucideIcons.check,
                                    color: Color(0xff0CC352),
                                  ),
                                  SizedBox(width: 4),
                                  CustomText(
                                    text: 'Success',
                                    size: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff0CC352),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          CustomText(
                            text: 'Download Receipt',
                            size: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          Spacer(),
                          Icon(LucideIcons.download),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          CustomButton(
            text: 'Next',
            voidCallback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentFailed()),
              );
            },
          ),
        ],
      ),
    );
  }
}
