import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/widgets/widgets.dart';

/// {@template block_header}
/// A header for the blocks that will contain [title] and a [label].
/// {@endtemplate}
class BlockHeader extends StatelessWidget {
  /// {@macro block_header}
  const BlockHeader({
    required this.title,
    required this.label,
    this.trailing,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  final String title;
  final int? label;
  final Widget? trailing;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Text(title, style: Theme.of(context).textTheme.h2),
          if (label != null) ...[
            const SizedBox(width: spacing4),
            CountBadge(
              count: label!,
            ),
          ],
          if (trailing != null) ...[
            const Spacer(),
            trailing!,
          ],
        ],
      ),
    );
  }
}
