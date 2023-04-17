import 'dart:developer';

import 'package:flutter/material.dart';

@immutable
class DynamicColor extends Color {
  const DynamicColor({
    required this.color,
    Color? darkColor,
  })  : darkColor = darkColor ?? color,
        super(0);

  final Color color;
  final Color darkColor;

  @override
  int get value => color.value;

  /// Returns color based on [context]'s brightness.
  Color resolveFrom(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    // final brightness = const MediaQueryData().platformBrightness;
    log(
      'DynamicColor($color): $brightness',
      name: 'DynamicColor::resolveFrom',
    );

    return brightness == Brightness.dark ? darkColor : color;
  }

  /// Returns color based on provided [brightness].
  Color resolveFromBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? darkColor : color;
  }
}

AppColors getAppColors(BuildContext context) {
  return Theme.of(context).extension<AppColors>()!;
}

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    this.blueMain,
    this.blueAccent,
    this.yellow,
    this.red,
    this.green,
    this.blueSecondary,
    this.background,
    this.white,
    this.lightGrey,
    this.middleGrey,
    this.grey,
    this.darkGrey,
    this.backgroundInverse,
    this.black,
  });

  final DynamicColor? blueMain;
  final DynamicColor? blueAccent;
  final DynamicColor? blueSecondary;
  final DynamicColor? background;
  final DynamicColor? backgroundInverse;
  final DynamicColor? white;
  final DynamicColor? black;
  final DynamicColor? lightGrey;
  final DynamicColor? middleGrey;
  final DynamicColor? grey;
  final DynamicColor? darkGrey;
  final DynamicColor? yellow;
  final DynamicColor? red;
  final DynamicColor? green;

  static const appColors = AppColors(
    blueMain: DynamicColor(
      color: Color(0xFF0087D2),
    ),
    blueAccent: DynamicColor(
      color: Color(0xFF00A7DA),
    ),
    blueSecondary: DynamicColor(
      color: Color(0xFF00407B),
    ),
    yellow: DynamicColor(
      color: Color(0xFFFFB800),
    ),
    red: DynamicColor(
      color: Color(0xFFE91B1B),
    ),
    green: DynamicColor(
      color: Color(0xFF29801B),
    ),
    lightGrey: DynamicColor(
      color: Color(0xFFEEF0F1),
    ),
    middleGrey: DynamicColor(
      color: Color(0xFF2F2F2F),
    ),
    background: DynamicColor(
      color: Color(0xFFFFFFFF),
      darkColor: Color(0xFF0C0C0C),
    ),
    backgroundInverse: DynamicColor(
      color: Color(0xFF0C0C0C),
      darkColor: Color(0xFFFFFFFF),
    ),
    black: DynamicColor(
      color: Color(0xFF000000),
    ),
    white: DynamicColor(
      color: Color(0xFFFFFFFF),
    ),
    grey: DynamicColor(
      color: Color(0xFF222222),
    ),
    darkGrey: DynamicColor(
      color: Color(0xFF161616),
    ),
  );

  @override
  ThemeExtension<AppColors> copyWith() {
    return const AppColors();
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    // TODO: implement lerp for DynamicColor
    return this;
  }
}
