import 'package:flutter/material.dart';

class UnderlineText extends StatelessWidget {
  final String text;
  const new({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color(0xff00388C),
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
