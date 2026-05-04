import 'package:flutter/material.dart';

class CustomShowDialog {
  //OPENS CALENDAR POP-UP
  static Future<DateTime?> openCalender(BuildContext context,
      DateTime initialDate, DateTime firstDate, DateTime lastDate) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            // primaryColor: Colors.orange, // Header color
            // accentColor: Colors.blue, // Selected date color
            colorScheme: const ColorScheme.light(
              primary: Colors.blue, // Header background color
              // onPrimary: Colors.white, // Header text color
              // surface: Colors.white, // Background color of the date picker
              // onSurface: Colors.black, // Text color
            ),
            dialogBackgroundColor:
                Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );
  }
}
