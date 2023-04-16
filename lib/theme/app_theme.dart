import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_typography.dart';

abstract class AppThemeBase {
  const AppThemeBase();

  ButtonStyle? elevatedButtonStyle() => null;

  ButtonStyle? outlinedButtonStyle() => null;

  ColorScheme get colorScheme;
  Brightness get brightness;

  ThemeData? themeData() {
    return ThemeData(
      brightness: brightness,
      useMaterial3: true,
    ).copyWith(
      colorScheme: colorScheme,
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
  const BrandThemeData({
    required this.colorScheme,
    this.brightness = Brightness.light,
  });

  factory BrandThemeData.dark() {
    return const BrandThemeData(
      colorScheme: brandDarkColorScheme,
      brightness: Brightness.dark,
    );
  }

  factory BrandThemeData.light() {
    return const BrandThemeData(
      colorScheme: ColorScheme.light(),
    );
  }

  @override
  final ColorScheme colorScheme;
  @override
  final Brightness brightness;

  @override
  ThemeData? themeData() {
    final theme = super.themeData()?.copyWith(
      extensions: [
        AppTypography.appTypography,
      ],
    );

    return theme?.copyWith(
      textTheme: theme.textTheme
          .copyWith(
            bodyMedium: theme.extension<AppTypography>()?.bodyM,
            labelLarge: theme.extension<AppTypography>()?.buttonL,
          )
          // actual for light theme, because default color is onPrimary.
          .apply(
            bodyColor: colorScheme.onBackground,
            displayColor: colorScheme.onBackground,
          ),
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
            return colorScheme.background;
          }

          return colorScheme.onPrimary;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.background;
          }

          return colorScheme.onPrimary;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.3);
          }

          return colorScheme.primary;
        },
      ),
    );
  }

  ButtonStyle _buildOutlinedButtonStyle() {
    return _buildBaseButtonStyle().copyWith(
      iconColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.outlineVariant.withOpacity(0.3);
          }

          return colorScheme.primary;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.outlineVariant.withOpacity(0.3);
          }

          return colorScheme.primary;
        },
      ),
      backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(
              color: colorScheme.outlineVariant.withOpacity(0.3),
            );
          }

          return BorderSide(
            color: colorScheme.primary,
          );
        },
      ),
    );
  }
}

const brandDarkColorScheme = ColorScheme.dark(
  primary: AppColors.blueMain,
  onPrimary: AppColors.white,
  secondary: AppColors.yellow,
  onSecondary: AppColors.black,
);
