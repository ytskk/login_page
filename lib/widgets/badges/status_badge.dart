import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/widgets/widgets.dart';

enum StatusBadgeType {
  waiting,
  positive,
  negative,
}

/// {@template status_badge}
/// A badge that displays a status. It can be waiting, positive or negative,
/// based on the [type] parameter.
///
/// See also:
/// - [InfoBadge]
/// {@endtemplate}
class StatusBadge extends StatelessWidget {
  /// {@macro status_badge}
  const StatusBadge({
    super.key,
    required this.text,
    this.type = StatusBadgeType.waiting,
  });

  final String text;
  final StatusBadgeType type;

  @override
  Widget build(BuildContext context) {
    return InfoBadge(
      backgroundColor: _mapStatusToColor(type),
      padding: const EdgeInsets.symmetric(
        horizontal: spacing8,
        vertical: spacing4,
      ),
      child: Text(
        text,
        style: captionTextStyle,
      ),
    );
  }

  Color _mapStatusToColor(StatusBadgeType type) {
    switch (type) {
      case StatusBadgeType.waiting:
        return AppColors.smokeGrey;
      case StatusBadgeType.positive:
        return AppColors.green;
      case StatusBadgeType.negative:
        return AppColors.red;
    }
  }
}
