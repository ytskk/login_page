import 'package:flutter/material.dart';

AppTypography getAppTypography(BuildContext context) {
  return Theme.of(context).extension<AppTypography>()!;
}

class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    this.baseTextStyle,
    this.hero,
    this.h1,
    this.h2,
    this.h3,
    this.bodyL,
    this.bodyM,
    this.bodyS,
    this.buttonL,
    this.buttonS,
    this.caption,
  });

  final TextStyle? baseTextStyle;
  final TextStyle? hero;
  final TextStyle? h1;
  final TextStyle? h2;
  final TextStyle? h3;
  final TextStyle? bodyL;
  final TextStyle? bodyM;
  final TextStyle? bodyS;
  final TextStyle? buttonL;
  final TextStyle? buttonS;
  final TextStyle? caption;

  static const appTypography = AppTypography(
    baseTextStyle: TextStyle(
      fontSize: 16,
      height: 1.4,
    ),
    hero: TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 24,
      height: 1.1,
    ),
    h1: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22,
      height: 1.1,
    ),
    h2: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      height: 1.1,
    ),
    h3: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 12,
      height: 1.67,
    ),
    bodyL: TextStyle(
      fontSize: 18,
      height: 1.4,
    ),
    bodyM: TextStyle(
      fontSize: 14,
      height: 1.4,
    ),
    bodyS: TextStyle(
      fontSize: 12,
      height: 1.4,
    ),
    buttonL: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
    buttonS: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    caption: TextStyle(
      fontSize: 12,
      height: 1.4,
    ),
  );

  @override
  ThemeExtension<AppTypography> copyWith({
    TextStyle? baseTextStyle,
    TextStyle? hero,
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? bodyL,
    TextStyle? bodyM,
    TextStyle? bodyS,
    TextStyle? buttonL,
    TextStyle? buttonS,
    TextStyle? caption,
  }) {
    return AppTypography(
      baseTextStyle: baseTextStyle ?? this.baseTextStyle,
      hero: hero ?? this.hero,
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      bodyL: bodyL ?? this.bodyL,
      bodyM: bodyM ?? this.bodyM,
      bodyS: bodyS ?? this.bodyS,
      buttonL: buttonL ?? this.buttonL,
      buttonS: buttonS ?? this.buttonS,
      caption: caption ?? this.caption,
    );
  }

  @override
  ThemeExtension<AppTypography> lerp(
    covariant ThemeExtension<AppTypography>? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }

    if (other is! AppTypography) {
      return this;
    }

    return AppTypography(
      baseTextStyle: TextStyle.lerp(baseTextStyle, other.baseTextStyle, t),
      hero: TextStyle.lerp(hero, other.hero, t),
      h1: TextStyle.lerp(h1, other.h1, t),
      h2: TextStyle.lerp(h2, other.h2, t),
      h3: TextStyle.lerp(h3, other.h3, t),
      bodyL: TextStyle.lerp(bodyL, other.bodyL, t),
      bodyM: TextStyle.lerp(bodyM, other.bodyM, t),
      bodyS: TextStyle.lerp(bodyS, other.bodyS, t),
      buttonL: TextStyle.lerp(buttonL, other.buttonL, t),
      buttonS: TextStyle.lerp(buttonS, other.buttonS, t),
      caption: TextStyle.lerp(caption, other.caption, t),
    );
  }
}
