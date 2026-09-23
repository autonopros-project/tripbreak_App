import 'package:flutter/material.dart';
import 'package:trip_break_final/screens/tab/chat_with_ai.dart';

class Helper extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatWithAI()),
        );
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: Colors.white,
        ),
        child: Center(child: Image.asset('assets/images/chatbot.png')),
      ),
    );
  }
}
