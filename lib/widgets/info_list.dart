import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/app_styles.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class InfoList extends StatelessWidget {
  const InfoList({
    required this.title,
    this.icon,
    this.content,
    super.key,
  });

  final Widget? icon;
  final Widget title;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return ConstrainedContentBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(height: spacing12),
          ],
          title,
          if (content != null) ...[
            const SizedBox(
              height: spacing40,
            ),
            content!,
          ],
        ],
      ),
    );
  }
}
