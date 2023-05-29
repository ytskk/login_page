import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';

enum SnackBarType { positive, negative, neutral }

/// {@template snack_bar}
/// Creates an object of type [SnackBar]
/// and displays it with [ScaffoldMessenger].
///
/// Use the [show] method to display.
/// {@endtemplate}
class SnackBarNotification {
  /// {@macro snack_bar}
  SnackBarNotification(
    this.message, {
    this.type = SnackBarType.neutral,
    this.durationMs = 2000,
  });

  /// Displayed message
  final String message;

  ///
  /// Defines background and border color [SnackBarNotification]
  ///
  /// [SnackBarType.negative] => red
  ///
  /// [SnackBarType.positive] => green
  ///
  /// [SnackBarType.neutral] => blue
  ///
  final SnackBarType type;

  ///
  /// Message display time in milliseconds
  ///
  final int durationMs;

  late ThemeData _appTheme;

  void show(BuildContext context) {
    _appTheme = Theme.of(context);
    ScaffoldMessenger.of(context)
      // ..hideCurrentSnackBar()
      .showSnackBar(
        _buildSnackBar(),
      );
  }

  SnackBar _buildSnackBar() {
    final color = _mapTypeToColor(type);
    return SnackBar(
      content: _buildContent(color),
      duration: Duration(milliseconds: durationMs),
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.all(padding16),
      backgroundColor: Colors.white24.withOpacity(0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius16),
        side: BorderSide(
          color: color,
        ),
      ),
    );
  }

  Widget _buildContent(Color color) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius16),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 8,
          sigmaY: 8,
        ),
        child: ColoredBox(
          color: color.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: padding16,
              horizontal: padding24,
            ),
            child: Center(
              child: Text(
                message,
                style: _appTheme.textTheme.bodyM
                    .copyWith(color: _appTheme.colorScheme.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _mapTypeToColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.negative:
        return _appTheme.colorScheme.red;
      case SnackBarType.positive:
        return _appTheme.colorScheme.green;
      case SnackBarType.neutral:
        return _appTheme.colorScheme.blue50;
    }
  }
}
