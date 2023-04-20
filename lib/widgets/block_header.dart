import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class BlockHeader extends StatelessWidget {
  const BlockHeader({
    super.key,
    required this.title,
    required this.label,
    this.trailing,
  });

  final String title;
  final int? label;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: h2TextStyle),
        if (label != null) ...[
          const SizedBox(width: smallSpacing1),
          CountBadge(
            count: label!,
          ),
        ],
        if (trailing != null) ...[
          const Spacer(),
          trailing!,
        ],
      ],
    );
  }
}
