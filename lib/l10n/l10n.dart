// ignore_for_file: dead_code

import 'package:flutter/cupertino.dart';

class L10n {
  static final all = [const Locale('en'), const Locale('ar')];
  static String getFlag(String code) {
    switch (code) {
      case 'ar':
        return 'πΈπ©';

      case 'en':
        return 'πΊπΈ';

      default:
        return 'no';
    }
  }
}
