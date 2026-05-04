import 'package:intl/intl.dart';

import '../../../../common_imports.dart';
import '../constants/constant_text.dart';

//  MANIPULATE STRINGS
extension CapExtension on String {
  ///Ex: arun.firstInCaps -> Arun
  String get firstInCaps =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : Constants.empty;

  ///Ex: arun.allInCaps -> ARUN
  String get allInCaps => toUpperCase();

  ///Ex: arun.inCaps -> Arun
  String get inCaps =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  ///Ex: arun kumar.capitalizeFirstofEach -> Arun Kumar
  String get capitalizeFirstofEach => replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((String str) => str.firstInCaps)
      .join(" ");

  ///Ex: books.toPlural -> books
  String toPlural({String? tailString = 's'}) => '$this$tailString';

  // /// formatedDate Output: 1999-04-11.
  // String get formatedDate =>
  //     DateFormat("yyyy-MM-dd").format(DateTime.parse(this)).toString();

  /// dmyFormatedDate Output: 02-04-1421.
  String get dmyFormatedDate =>
      DateFormat("dd-MMM-yyyy").format(DateTime.parse(this)).toString();

  // ///dMFormatedDate Output: 02-04.
  // String get dMFormatedDate =>
  //     DateFormat("dd-MMM").format(DateTime.parse(this)).toString();

  // ///dMYYFormatedDate Output: 02-04-21.
  // String get dMYYFormatedDate =>
  //     DateFormat("dd-MMM-yy").format(DateTime.parse(this)).toString();

  // ///shortMonth Output: Apr
  // String get shortMonth => DateFormat('MMM')
  //     .format(DateTime(0, DateTime.parse(this).month))
  //     .toString();

  // ///fullMonth Output: April
  // String get fullMonth => DateFormat('MMMM')
  //     .format(DateTime(0, DateTime.parse(this).month))
  //     .toString();

  // ///dayOfWeek Output: Thu
  // String get dayOfWeek => DateFormat('EEE').format(DateTime.parse(this));

  // /// formatedTime Output:10:33.

  // String get formatedTime =>
  //     DateFormat("HH:mm").format(DateTime.parse(this)).toString();

  // ///formatedTimeWithAMorPM Output:10:33 AM
  // String get formatedTimeWithAMorPM =>
  //     DateFormat('hh:mm a').format(DateTime.parse(this)).toString();

  // ///splitLastFormat Output: .jpg
  // String get splitLastFormat => split('.').last.toString().toLowerCase();

  // /// DateTime is a custom formate.
  // ///
  // /// 2022-07-08T16:14:09.825Z. this formate data is returened
  // /// Dart
  // /// example:
  // /// DateTime.now().toString().customFormatDate
  // ///
  // String get customFormatDate => DateTime.utc(
  //         DateTime.parse(this).year,
  //         DateTime.parse(this).month,
  //         DateTime.parse(this).day,
  //         DateTime.parse(this).hour,
  //         DateTime.parse(this).minute,
  //         DateTime.parse(this).second,
  //         DateTime.parse(this).millisecond)
  //     .toIso8601String()
  //     .toString();

  // ///Generate a unique id based on user enrollment id and Current date time .
  // ///
  // ///OUTPUT: 3454758765467820221111051247888555
  // ///Dart
  // ///example:
  // ///`"34547587654678".generateId`
  // ///
  // String get generateId =>
  //     this +
  //     DateTime.now()
  //         .toIso8601String()
  //         .replaceAll("-", "")
  //         .replaceAll(" ", "")
  //         .replaceAll("T", "")
  //         .replaceAll(":", "")
  //         .replaceAll(".", "");

  // String get showLastFiveDigits => replaceRange(0, length - 5, "");

  // String get removeTimeFormate => replaceAll("M", Constants.empty)
  //     .replaceAll("E", Constants.empty)
  //     .replaceAll("N", Constants.empty)
  //     .replaceAll("_", ":");
}

// //validate strings
// extension ValidateStrings on String {
//   /// validate email address
//   ///
//   /// Dart
//   /// example:
//   /// "cloudnext@cloudnext.in".customFormatDate
//   /// return:true or false
//   ///
//   bool get validateEmail => RegExp(
//           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//       .hasMatch(this);

//   /// validate mobileNumber
//   ///
//   /// Dart
//   /// example:
//   /// "9876543210".validateMobileNumber
//   /// return:true or false
//   ///
//   bool get validateMobileNumber =>
//       RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(this);

//   /// validate FirstName
//   ///
//   /// Dart
//   /// example:
//   /// "Samantha".validateFirstName
//   /// return:true or false
//   ///
//   bool get validateFirstName => RegExp(r"([a-zA-Z]{3,30}\s*)+").hasMatch(this);

//   /// validate LastName
//   ///
//   /// Dart
//   /// example:
//   /// "Ruthupabhu".validateFirstName
//   /// return:true or false
//   ///
//   bool get validateLastName =>
//       RegExp(r"^[A-Za-z][A-Za-z0-9_]{0,29}$").hasMatch(this);

//   /// validate Register Number
//   ///
//   /// Dart
//   /// example:
//   /// "3A456FFTG7867".validateRegistationNumber
//   /// return:true or false
//   ///
//   bool get validateRegistationNumber =>
//       RegExp(r"^[a-zA-Z0-9_.-]{6,29}$").hasMatch(this);

//   /// validate validate pin
//   ///
//   /// Dart
//   /// example:
//   /// "4444".validatePin
//   /// return:true or false
//   ///
//   bool get validatePin => RegExp(r'^[0-9]{4,4}$').hasMatch(this);

//   /// validate validate pin
//   ///
//   /// Dart
//   /// example:
//   /// "4463847683944".validateOnlyNumber
//   /// return: True or false
//   ///
//   bool get validateOnlyNumber => RegExp(r'^[0-9]+$').hasMatch(this);
// }

// extension ValidateDate on DateTime {
//   /// compare Date and Time.
//   ///
//   /// compare Two Dates and retun TRUE or FALSE
//   /// Dart
//   /// "2022-08-18 08:22".
//   /// return: `TRUE` or `FALSE`
//   ///
//   bool get sub10minDate =>
//       compareTo(DateTime.now().subtract(const Duration(minutes: 10))) == -1
//           ? false
//           : true;
// }

// extension DoubleExtensions on double {
//   /// Calculates the specified percentage of the value
//   double getPercentage(double percentage) => this * percentage / 100;

//   /// Returns double with the given number of decimal places
//   double toPrecision({int? digitsAfterDecimal}) =>
//       double.parse(toStringAsFixed(digitsAfterDecimal ?? 2));
// }

// extension Iterables<E> on Iterable<E> {
//   /// Group the elements of an iterable according to the given function.
//   Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
//       <K, List<E>>{},
//       (Map<K, List<E>> map, E element) =>
//           map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
// }

extension EmptyPaddding on num {
  /// Returns a [SizedBox] with the given padding
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}

extension SizeHelper on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
}

// extension DateTimeExtension on DateTime? {
//   /// Returns `true` if the date is today

//   bool? isAfterOrEqualTo(DateTime dateTime) {
//     final DateTime? date = this;
//     if (date != null) {
//       final bool isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
//       return isAtSameMomentAs | date.isAfter(dateTime);
//     }
//     return null;
//   }

//   bool? isBeforeOrEqualTo(DateTime dateTime) {
//     final DateTime? date = this;
//     if (date != null) {
//       final bool isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
//       return isAtSameMomentAs | date.isBefore(dateTime);
//     }
//     return null;
//   }

//   bool? isBetween(DateTime fromDateTime, DateTime toDateTime) {
//     final DateTime? date = this;
//     if (date != null) {
//       final bool isAfter = date.isAfterOrEqualTo(fromDateTime) ?? false;
//       final bool isBefore = date.isBeforeOrEqualTo(toDateTime) ?? false;
//       return isAfter && isBefore;
//     }
//     return null;
//   }
// }
