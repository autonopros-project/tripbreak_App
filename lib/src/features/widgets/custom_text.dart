import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String writtenText;
  final TextAlign? textAlign;
  final TextStyle textStyle;
  final int? maxLines;
  const CustomText({
    required this.writtenText,
    required this.textStyle,
    this.textAlign = TextAlign.start,
    this.maxLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis, // Adjust overflow behavior
      text: TextSpan(
        children: _buildTextSpans(writtenText, textStyle),
      ),
    );
  }

  List<TextSpan> _buildTextSpans(String text, TextStyle style) {
    final List<TextSpan> spans = <TextSpan>[];
    final List<String> parts = text.split('*'); // Split at asterisk
    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(
        text: parts[i],
        style: style,
      ));
      if (i < parts.length - 1) {
        // Add the red asterisk for all but the last part
        spans.add(TextSpan(
          text: '*',
          style: style.copyWith(color: Colors.red),
        ));
      }
    }
    return spans;
  }
}
