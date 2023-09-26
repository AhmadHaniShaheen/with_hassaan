import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingController extends ChangeNotifier {
  bool isDark = false;
  bool isArabic = false;
  changeMode() {
    isDark = !isDark;
    notifyListeners();
  }

  changeLange(BuildContext context) {
    isArabic = !isArabic;
    final currentLange = context.locale;
    if (currentLange == const Locale('en')) {
      context.setLocale(const Locale('ar'));
    } else {
      context.setLocale(const Locale('en'));
    }
    notifyListeners();
  }
}
