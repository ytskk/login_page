import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';

enum ButtonSize {
  small,
  large,
}

enum ButtonType {
  primary,
  secondary,
}

/// {@template brand_button}
/// A button with a brand style. It has two types: primary and secondary.
/// Primary button has a solid background color and secondary button has a
/// transparent background with a border.
///
/// Buttons can have an icon and a text. If you want to use an icon, use
/// [BrandButton.icon] constructor.
///
/// Buttons have two sizes: small and large.
///
/// See also:
/// - [ButtonSize]
/// - [ButtonType]
/// {@endtemplate}
class BrandButton extends StatelessWidget {
  const BrandButton({
    super.key,
    required this.child,
    this.size = ButtonSize.small,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.type = ButtonType.primary,
  });

  factory BrandButton.icon({
    required Widget icon,
    required Widget child,
    ButtonSize size,
    VoidCallback? onPressed,
    double? gap,
    Color? backgroundColor,
    Color? foregroundColor,
    ButtonType type,
  }) = _BrandButtonWithIcon;

  final ButtonSize size;
  final Widget child;
  final VoidCallback? onPressed;

  /// Color for primary button type. Color for border color and content color
  /// for secondary button type.
  final Color? backgroundColor;

  /// Color for icon and text for primary button type. Does not affect secondary
  /// button type.
  final Color? foregroundColor;
  final ButtonType type;

  static const double _smallIconSize = 20;
  static const double _largeIconSize = 24;

  Color get _backgroundColor => backgroundColor ?? AppColors.blueMain;
  Color get _foregroundColor => foregroundColor ?? Colors.white;

  EdgeInsets get _buttonPadding {
    if (size == ButtonSize.small) {
      return const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      );
    }

    return const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    );
  }

  TextStyle get _buttonTextStyle {
    if (size == ButtonSize.small) {
      return buttonSTextStyle;
    }

    return buttonLTextStyle;
  }

  @override
  Widget build(BuildContext context) {
    final _buttonStyle = type == ButtonType.primary
        ? _buildPrimaryButtonStyle()
        : _buildSecondaryButtonStyle();

    return ElevatedButton(
      style: _buttonStyle,
      onPressed: onPressed,
      child: child,
    );
  }

  /// Defines base style with common properties for both button types
  /// (primary and secondary).
  ButtonStyle _buildBaseButtonStyle() {
    return ButtonStyle(
      elevation: const MaterialStatePropertyAll(0),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      textStyle: MaterialStateProperty.all(_buttonTextStyle),
      padding: MaterialStatePropertyAll(_buttonPadding),
      iconSize: MaterialStatePropertyAll(
        size == ButtonSize.small ? _smallIconSize : _largeIconSize,
      ),
    );
  }

  _buildPrimaryButtonStyle() {
    return _buildBaseButtonStyle().copyWith(
      iconColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.darkGrey;
          }

          return _foregroundColor;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.darkGrey;
          }

          return foregroundColor;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.white.withOpacity(0.3);
          }

          return backgroundColor;
        },
      ),
    );
  }

  _buildSecondaryButtonStyle() {
    return _buildBaseButtonStyle().copyWith(
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(
              color: _backgroundColor.withOpacity(0.3),
              width: 1,
            );
          }

          return BorderSide(
            color: _backgroundColor,
            width: 1,
          );
        },
      ),
      iconColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return _backgroundColor.withOpacity(0.3);
          }

          return _backgroundColor;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return _backgroundColor.withOpacity(0.3);
          }

          return _backgroundColor;
        },
      ),
      backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
    );
  }
}

class _BrandButtonWithIcon extends BrandButton {
  _BrandButtonWithIcon({
    required Widget icon,
    required Widget child,
    super.size = ButtonSize.small,
    super.onPressed,
    double? gap = _defaultIconGap,
    super.backgroundColor,
    super.foregroundColor,
    super.type = ButtonType.primary,
  }) : super(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              SizedBox(width: gap),
              child,
            ],
          ),
        );

  static const double _defaultIconGap = 8;
}
