import 'package:flutter/material.dart';

extension BrandColors on ColorScheme {
  bool get isDark => brightness == Brightness.dark;

  // base
  Color get white => const Color(0xFFFFFFFF);
  Color get black => const Color(0xFF000000);

  Color get backgroundColor => isDark ? black : white;
  Color get backgroundInverse => isDark ? white : black;

  // grey
  Color get grey10 => const Color(0xFFEEF0F1);
  Color get grey50 => const Color(0xFF2F2F2F);
  Color get grey60 => const Color(0xFF424242);
  Color get grey70 => const Color(0xFF222222);
  Color get grey90 => const Color(0xFF161616);

  // blue
  Color get blue30 => const Color(0xFF00A7DA);
  Color get blue50 => const Color(0xFF0087D2);
  Color get blue70 => const Color(0xFF00407B);

  // other
  Color get red => const Color(0xFFE91B1B);
  Color get yellow => const Color(0xFFFFB800);
  Color get green => const Color(0xFF29801B);
}
