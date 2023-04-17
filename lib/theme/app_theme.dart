import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart' hide AppColors;
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';

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
      extensions: const [
        AppTypography.appTypography,
        AppColors.appColors,
      ],
    );

    final appColors = theme.extension<AppColors>()!;

    _themeData = theme.copyWith(
      scaffoldBackgroundColor:
          appColors.background?.resolveFromBrightness(brightness),
      colorScheme: colorScheme.copyWith(
        primary: appColors.blueMain?.resolveFromBrightness(brightness),
        onPrimary: appColors.white?.resolveFromBrightness(brightness),
        secondary: appColors.yellow?.resolveFromBrightness(brightness),
        onSecondary: appColors.black?.resolveFromBrightness(brightness),
        surface: appColors.background?.resolveFromBrightness(brightness),
        surfaceTint: appColors.background?.resolveFromBrightness(brightness),
      ),
    );
    _themeData = _themeData.copyWith(
      textTheme: theme.textTheme
          .copyWith(
            bodyMedium: theme.extension<AppTypography>()?.bodyM,
            labelLarge: theme.extension<AppTypography>()?.buttonL,
          )
          // actual for light theme, because default color is onPrimary.
          .apply(
            bodyColor:
                appColors.backgroundInverse?.resolveFromBrightness(brightness),
            displayColor:
                appColors.backgroundInverse?.resolveFromBrightness(brightness),
          ),
    );

    return _themeData;
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
        _themeData.extension<AppTypography>()?.buttonS,
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
    final appColors = _themeData.extension<AppColors>()!;

    return _buildBaseButtonStyle().copyWith(
      iconColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return appColors.darkGrey?.resolveFromBrightness(brightness);
          }

          return _themeData.colorScheme.onPrimary;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return appColors.darkGrey?.resolveFromBrightness(brightness);
          }

          return _themeData.colorScheme.onPrimary;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return appColors.backgroundInverse
                ?.resolveFromBrightness(brightness)
                .withOpacity(0.3);
          }

          return _themeData.colorScheme.primary;
        },
      ),
    );
  }

  ButtonStyle _buildOutlinedButtonStyle() {
    final appColors = _themeData.extension<AppColors>()!;

    return _buildBaseButtonStyle().copyWith(
      iconColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return appColors.backgroundInverse
                ?.resolveFromBrightness(brightness)
                .withOpacity(0.3);
          }

          return _themeData.colorScheme.primary;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return appColors.backgroundInverse
                ?.resolveFromBrightness(brightness)
                .withOpacity(0.3);
          }

          return _themeData.colorScheme.primary;
        },
      ),
      backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(
              color: appColors.backgroundInverse!
                  .resolveFromBrightness(brightness)
                  .withOpacity(0.3),
            );
          }

          return BorderSide(
            color: _themeData.colorScheme.primary,
          );
        },
      ),
    );
  }
}

final brandLightColorScheme = ColorScheme.fromSeed(
  seedColor: AppColors.appColors.blueMain!.resolveFromBrightness(
    Brightness.light,
  ),
  brightness: Brightness.light,
);

final brandDarkColorScheme = ColorScheme.fromSeed(
  seedColor: AppColors.appColors.blueMain!.resolveFromBrightness(
    Brightness.dark,
  ),
  brightness: Brightness.dark,
);
