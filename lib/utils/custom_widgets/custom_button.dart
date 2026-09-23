import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback voidCallback;
  const new({super.key, required this.text, required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: 90,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: voidCallback,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffFFCC00),
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff00388C),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
