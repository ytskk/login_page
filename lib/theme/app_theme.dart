import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart' hide AppColors;
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/utils.dart';

abstract class AppThemeBase {
  const AppThemeBase();

  ButtonStyle? elevatedButtonStyle() => null;

  ButtonStyle? outlinedButtonStyle() => null;

  ColorScheme get colorScheme;
  Brightness get brightness;
  bool? get useMaterial3;

  ThemeData themeData();

  ThemeData buildThemeData() {
    return themeData().copyWith(
      // colorScheme: colorScheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: elevatedButtonStyle(),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: outlinedButtonStyle(),
      ),
    );
  }
}

class BrandThemeData extends AppThemeBase {
  BrandThemeData({
    required this.colorScheme,
    this.brightness = Brightness.light,
    this.useMaterial3 = true,
  });

  static ThemeData dark({
    bool? useMaterial3,
  }) {
    return BrandThemeData(
      colorScheme: brandDarkColorScheme,
      brightness: Brightness.dark,
      useMaterial3: useMaterial3,
    ).buildThemeData();
  }

  static ThemeData light({
    bool? useMaterial3,
  }) {
    return BrandThemeData(
      colorScheme: brandLightColorScheme,
      useMaterial3: useMaterial3,
    ).buildThemeData();
  }

  @override
  final ColorScheme colorScheme;
  @override
  final Brightness brightness;
  @override
  final bool? useMaterial3;

  late ThemeData _themeData;

  /// Holds theme configured color scheme after [themeData] was called.
  /// Use careful! Only after calling themeData()
  ColorScheme get colors => _themeData.colorScheme;

  @override
  ThemeData themeData() {
    log(
      'Rebuilding theme data...',
      name: 'BrandThemeData::themeData',
    );
    final _useMaterial3 = useMaterial3 ?? true;

    final theme = ThemeData(
      useMaterial3: _useMaterial3,
      brightness: brightness,
    );

    final colors = theme.colorScheme;

    // build colors
    _themeData = theme.copyWith(
      scaffoldBackgroundColor: colors.background,
      colorScheme: colorScheme.copyWith(
        primary: colorScheme.blue50,
        onPrimary: colorScheme.white,
        secondary: colorScheme.yellow,
        onSecondary: colorScheme.black,
        surface: colorScheme.background,
        surfaceTint: colorScheme.background,
      ),
    );

    // build text theme
    _themeData = _themeData.copyWith(
      textTheme: _buildTextTheme(),
    );

    return _themeData;
  }

  _buildTextTheme() {
    final textTheme = _themeData.textTheme;

    return _themeData.textTheme
        .copyWith(
          bodyMedium: textTheme.bodyL,
        )
        .apply(
          bodyColor: colors.backgroundInverse,
          displayColor: colors.backgroundInverse,
        );
  }

  // Buttons.

  @override
  ButtonStyle? elevatedButtonStyle() => _buildElevatedButtonStyle();

  @override
  ButtonStyle? outlinedButtonStyle() => _buildOutlinedButtonStyle();

  /// Defines base style with common properties for both button types
  /// (elevated and outlined).
  ButtonStyle _buildBaseButtonStyle() {
    return ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        _themeData.textTheme.bodyS.medium,
      ),
      elevation: const MaterialStatePropertyAll(0),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      iconSize: const MaterialStatePropertyAll(iconSize20),
    );
  }

  ButtonStyle _buildElevatedButtonStyle() {
    return _buildBaseButtonStyle().copyWith(
      iconColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return colors.grey90;
          }

          return colors.white;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return colors.grey90;
          }

          return colors.white;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return colors.backgroundInverse.withOpacity(0.3);
          }

          return colors.primary;
        },
      ),
    );
  }

  ButtonStyle _buildOutlinedButtonStyle() {
    return _buildBaseButtonStyle().copyWith(
      iconColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return colors.backgroundInverse.withOpacity(0.3);
          }

          return colors.primary;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return colors.backgroundInverse.withOpacity(0.3);
          }

          return colors.primary;
        },
      ),
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (!states.contains(MaterialState.disabled)) {
            return colors.primary.withOpacity(0.12);
          }

          return null;
        },
      ),
      backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(
              color: colors.backgroundInverse.withOpacity(0.3),
            );
          }

          return BorderSide(
            color: colors.primary,
          );
        },
      ),
    );
  }
}

final brandLightColorScheme = ColorScheme.fromSeed(
  seedColor: const ColorScheme.light().blue50,
  brightness: Brightness.light,
);

final brandDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const ColorScheme.dark().blue50,
  brightness: Brightness.dark,
);