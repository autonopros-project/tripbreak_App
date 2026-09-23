import 'package:flutter/material.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({super.key});

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  int selectedOption = 0;

  Widget optionCard({
    required int index,
    required String title,
    required String price,
  }) {
    final bool isSelected = selectedOption == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedOption = index;
          });
        },
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              color: isSelected
                  ? const Color(0xff00388C)
                  : const Color(0xffE5E7EB),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff767676),
                ),
              ),
              SizedBox(height: 2),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xffE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PAYMENT OPTION',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              optionCard(index: 0, title: 'Pay in full', price: '₹28,290'),
              SizedBox(width: 8),
              optionCard(
                index: 1,
                title: 'Split / EMI',
                price: 'From ₹4,715/mo',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
