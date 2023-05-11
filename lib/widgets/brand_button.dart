import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_typography.dart';

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
    required this.child,
    this.size = ButtonSize.small,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.type = ButtonType.primary,
    this.padding,
    super.key,
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

  /// Background color for [ButtonType.primary]. Does not affect
  /// on [ButtonType.secondary].
  final Color? backgroundColor;

  /// Color for icon and text. Color for border in [ButtonType.secondary].
  final Color? foregroundColor;
  final ButtonType type;

  // Custom padding
  final EdgeInsets? padding;

  EdgeInsets? get _buttonPadding {
    if (padding != null) return padding;

    if (size == ButtonSize.small) {
      return const EdgeInsets.symmetric(
        horizontal: padding24,
        vertical: padding12,
      );
    }

    return const EdgeInsets.symmetric(
      horizontal: padding24,
      vertical: padding16,
    );
  }

  TextStyle? _buttonTextStyle(BuildContext context) {
    final typography = Theme.of(context).textTheme;

    if (size == ButtonSize.small) {
      return typography.buttonS;
    }

    return typography.buttonL;
  }

  double get _iconSize => size == ButtonSize.small ? iconSize20 : iconSize24;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final sizedTextStyle = _buttonTextStyle(context);

    if (type == ButtonType.secondary) {
      return OutlinedButton(
        style: _buildOutlinedButtonStyle(
          colorScheme,
          sizedTextStyle,
        ),
        onPressed: onPressed,
        child: child,
      );
    }

    return ElevatedButton(
      style: _buildElevatedButtonStyle(
        colorScheme,
        sizedTextStyle,
      ),
      onPressed: onPressed,
      child: child,
    );
  }

  /// Applies base button style to [BrandButton]. It applies padding and text
  /// style.
  ButtonStyle _buildBaseButtonStyle(TextStyle? textStyle) {
    return ButtonStyle(
      padding: MaterialStateProperty.all(_buttonPadding),
      textStyle: MaterialStateProperty.all(textStyle),
      iconSize: MaterialStatePropertyAll(_iconSize),
    );
  }

  ButtonStyle _buildElevatedButtonStyle(
    ColorScheme colorScheme,
    TextStyle? textStyle,
  ) {
    return _buildBaseButtonStyle(textStyle).copyWith(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (!states.contains(MaterialState.disabled)) {
            return backgroundColor;
          }
          return null;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (!states.contains(MaterialState.disabled)) {
            return foregroundColor;
          }
          return null;
        },
      ),
      iconColor: MaterialStateProperty.resolveWith(
        (states) {
          if (!states.contains(MaterialState.disabled)) {
            return foregroundColor;
          }
          return null;
        },
      ),
    );
  }

  ButtonStyle _buildOutlinedButtonStyle(
    ColorScheme colorScheme,
    TextStyle? textStyle,
  ) {
    return _buildBaseButtonStyle(textStyle).copyWith(
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (!states.contains(MaterialState.disabled)) {
            return foregroundColor?.withOpacity(0.12);
          }
          return null;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (!states.contains(MaterialState.disabled)) {
            return foregroundColor;
          }
          return null;
        },
      ),
      iconColor: MaterialStateProperty.resolveWith(
        (states) {
          if (!states.contains(MaterialState.disabled)) {
            return foregroundColor;
          }
          return null;
        },
      ),
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (!states.contains(MaterialState.disabled)) {
            if (foregroundColor != null) {
              return BorderSide(
                color: foregroundColor!,
              );
            }
          }
          return null;
        },
      ),
    );
  }
}

class _BrandButtonWithIcon extends BrandButton {
  _BrandButtonWithIcon({
    required Widget icon,
    required Widget child,
    super.size,
    super.onPressed,
    double? gap = spacing4,
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
}
