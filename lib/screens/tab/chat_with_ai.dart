import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';

class ChatWithAI extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'TripBreak Buddy',
          size: 24,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Color(0xff121212),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(LucideIcons.arrowLeft, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {},
              child: Icon(LucideIcons.menu, color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFF121212),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              LucideIcons.plusCircle600,
                              color: Color(0xff00388C),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hint: Text(
                                  'ask anything...',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Image.asset('assets/images/share.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                InkWell(
                  onTap: () {},
                  child: Image.asset('assets/images/microphone.png'),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
