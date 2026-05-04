import 'dart:developer';
import 'package:flutter/foundation.dart';

void printDebug(Object? value) {
  if (kDebugMode) {
    if (kIsWeb) {
      print(value);
    } else {
      log(value.toString());
    }
  }
}
