import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class DaySummaryContainer extends StatelessWidget {
  final String time;
  final IconData icon;
  final String title, subtitle;
  final bool isFirst, isLast;

  const DaySummaryContainer({
    super.key,
    required this.time,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 38,
            child: Text(
              time,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff1A1A1A),
              ),
            ),
          ),
          SizedBox(width: 8),
          SizedBox(
            width: 10,
            height: 42,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: isFirst ? 21 : 0,
                  bottom: isLast ? 21 : 0,
                  child: Container(width: 2, color: const Color(0xffF5C518)),
                ),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xffF5C518),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 6),
          Expanded(
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xffFEF3D2),
                    child: Icon(icon, size: 14, color: const Color(0xff767676)),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1D1D1A),
                          ),
                        ),
                        Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff767676),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 4),
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xffFEF3D2),
                    child: const Icon(
                      LucideIcons.ellipsis,
                      size: 13,
                      color: Color(0xff4E4E4E),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
