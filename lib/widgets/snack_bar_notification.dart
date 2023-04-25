import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';

import '../screens/login_screen/login_screen.dart';

enum SnackBarType { positive, negative, neutral }

class SnackBarNotification {
  SnackBarNotification(this.message,
      {this.type = SnackBarType.neutral, this.durationMs = 20000});

  final String message;
  final SnackBarType type;
  final int durationMs;

  late ThemeData _appTheme;

  void show(BuildContext context) {
    _appTheme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      _buildSnackBar(),
    );
  }

  SnackBar _buildSnackBar() {
    final color = _mapTypeToColor(type);
    return SnackBar(
      content: _buildContent(),
      duration: Duration(milliseconds: durationMs),
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.all(padding16),
      backgroundColor: color.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius16),
        side: BorderSide(
          width: 1,
          color: color,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: padding16, horizontal: padding24),
          child: Center(
            child: Text(
              message,
              style: _appTheme.textTheme.bodyM
                  .copyWith(color: _appTheme.colorScheme.white),
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