import 'dart:ui';

import '../../../../common_imports.dart';
import 'colors.dart';


class ThemeTextStyle {
  // static const String fontFamily = "Poppins";

  ///HERE U CAN PASS UR REQUIRED PARAMETERS LIKE COLOR, FONT WEIGHT, FONT SIZE
  static TextStyle style({
    Color color = ThemeColors.blackColor,
    FontWeight fontWeight = FontWeight.bold,
    double fontSize = 16.0,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: decoration,
        overflow: overflow,
      );

  // ///Here the font size is 20% of the screen width
  // static TextStyle heading1({
  //   required double width,
  //   Color color = Colors.black,
  //   FontWeight fontWeight = FontWeight.bold,
  //   TextOverflow overflow = TextOverflow.visible,
  //   TextDecoration? decoration,
  // }) => TextStyle(
  //     color: color,
  //     fontWeight: fontWeight,
  //     fontSize: width * .2,
  //     decoration: decoration,
  //     overflow: overflow,
  //   );

  // ///Here the font size is 15% of the screen width
  // static TextStyle heading2({
  //   required double width,
  //   Color color = Colors.black,
  //   FontWeight fontWeight = FontWeight.w700,
  //   TextOverflow overflow = TextOverflow.visible,
  //   TextDecoration? decoration,
  // }) => TextStyle(
  //     color: color,
  //     fontWeight: fontWeight,
  //     fontSize: width * .15,
  //     decoration: decoration,
  //     overflow: overflow,
  //   );

  // ///Here the font size is 10% of the screen width
  // static TextStyle heading3({
  //   required double width,
  //   Color color = Colors.black,
  //   FontWeight fontWeight = FontWeight.w600,
  //   TextOverflow overflow = TextOverflow.visible,
  //   TextDecoration? decoration,
  // }) => TextStyle(
  //     color: color,
  //     fontWeight: fontWeight,
  //     fontSize: width * .10,
  //     decoration: decoration,
  //     overflow: overflow,
  //   );

  // ///Here the font size is 8% of the screen width
  // static TextStyle heading4({
  //   required double width,
  //   Color color = Colors.black,
  //   FontWeight fontWeight = FontWeight.w500,
  //   TextOverflow overflow = TextOverflow.visible,
  //   TextDecoration? decoration,
  // }) => TextStyle(
  //     color: color,
  //     fontWeight: fontWeight,
  //     fontSize: width * .08,
  //     decoration: decoration,
  //     overflow: overflow,
  //   );

  // ///Here the font size is 6% of the screen width
  // static TextStyle heading5({
  //   required double width,
  //   Color color = Colors.black,
  //   FontWeight fontWeight = FontWeight.w400,
  //   TextOverflow overflow = TextOverflow.visible,
  //   TextDecoration? decoration,
  // }) => TextStyle(
  //     color: color,
  //     fontWeight: fontWeight,
  //     fontSize: width * .06,
  //     decoration: decoration,
  //     overflow: overflow,
  //   );

  // ///Here the font size is 4% of the screen width
  // static TextStyle heading6({
  //   required double width,
  //   Color color = Colors.black,
  //   FontWeight fontWeight = FontWeight.normal,
  //   TextOverflow overflow = TextOverflow.visible,
  //   TextDecoration? decoration,
  // }) => TextStyle(
  //     color: color,
  //     fontWeight: fontWeight,
  //     fontSize: width * .04,
  //     decoration: decoration,
  //     overflow: overflow,
  //   );
}
