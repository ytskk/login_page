import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';

enum SnackBarType { positive, negative, neutral }

class SnackBarNotification {
  SnackBarNotification(this.message,
      {this.type = SnackBarType.neutral, this.durationMs = 2000});

  final String message;
  final SnackBarType type;
  final int durationMs;

  void show(BuildContext context) {
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
              style: bodyMTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  Color _mapTypeToColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.negative:
        return AppColors.red;
      case SnackBarType.positive:
        return AppColors.green;
      case SnackBarType.neutral:
        return AppColors.blueMain;
    }
  }
}
