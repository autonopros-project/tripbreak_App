class RegularExpression {
  static final RegExp aplhabetWithDotSpaceRegExp = RegExp(r'[a-zA-Z\s.]');
  static final RegExp validateDoubleValues =
      // RegExp(r'^(\d+)?\.?\d{0,2}'); // eg: 54642.55
      RegExp(r'^\d*\.?\d{0,2}$');
  static final RegExp capsAlphaNumericRegExp = RegExp("[A-Z0-9]+");
}
