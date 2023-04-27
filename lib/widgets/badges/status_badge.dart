import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
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
    required this.text,
    this.type = StatusBadgeType.waiting,
    super.key,
  });

  final String text;
  final StatusBadgeType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InfoBadge(
      backgroundColor: _mapStatusToColor(type, theme),
      padding: const EdgeInsets.symmetric(
        horizontal: spacing8,
        vertical: spacing4,
      ),
      child: Text(
        text,
        style: theme.textTheme.captionTextStyle,
      ),
    );
  }

  Color _mapStatusToColor(StatusBadgeType type, ThemeData theme) {
    switch (type) {
      case StatusBadgeType.waiting:
        return theme.colorScheme.grey60;
      case StatusBadgeType.positive:
        return theme.colorScheme.green;
      case StatusBadgeType.negative:
        return theme.colorScheme.red;
    }
  }
}
