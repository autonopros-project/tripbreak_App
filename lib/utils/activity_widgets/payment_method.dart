import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int selectedMethod = 1;

  Widget paymentOption({
    required int index,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final bool isSelected = selectedMethod == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = index;
        });
      },
      child: Container(
        height: 54,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? const Color(0xff00388C)
                : const Color(0xffE5E7EB),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  const BoxShadow(
                    color: Color(0x1500388C),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xffEEF3FF),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(icon, size: 17, color: const Color(0xff00388C)),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 1),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff767676),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xff00388C)
                      : const Color(0xff767676),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xff00388C),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CHOOSE PAYMENT METHOD',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          paymentOption(
            index: 0,
            icon: LucideIcons.walletCards,
            title: 'UPI',
            subtitle: 'Paytm, Google Pay, PhonePe or other apps',
          ),
          paymentOption(
            index: 1,
            icon: LucideIcons.creditCard,
            title: '•••• 4821',
            subtitle: 'Visa · Expires 08/29',
          ),
          paymentOption(
            index: 2,
            icon: LucideIcons.circlePlus,
            title: 'Add new card',
            subtitle: 'Credit or debit card',
          ),
        ],
      ),
    );
  }
}
