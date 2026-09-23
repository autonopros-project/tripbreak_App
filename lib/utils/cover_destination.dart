import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';

class CoverDestination extends StatelessWidget {
  final String image, place, description, price, rating;
  const CoverDestination({
    super.key,
    required this.image,
    required this.place,
    required this.description,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 270,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    image,
                    width: double.infinity,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        LucideIcons.heartOff,
                        color: Colors.redAccent,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 12, 18, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: place,
                      size: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff1D1D1F),
                    ),
                    SizedBox(height: 5),
                    CustomText(
                      text: description,
                      size: 11,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff6E6E73),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: price,
                          size: 14,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xff00388C),
                        ),
                        Row(
                          children: [
                            Icon(
                              LucideIcons.star,
                              size: 14,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 5),
                            CustomText(
                              text: rating,
                              size: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff1D1D1F),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
