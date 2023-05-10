import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';

class ModalBottomSheetWrapper extends StatelessWidget {
  const ModalBottomSheetWrapper({
    required this.content,
    this.title,
    this.trailing,
    super.key,
  });

  final Widget? title;
  final Widget? trailing;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    final _titleStyled = _buildStyledTitle(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        spacing16,
        spacing24,
        spacing16,
        spacing44,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: _titleStyled,
              ),
              if (trailing != null) trailing!,
            ],
          ),
          content,
        ],
      ),
    );
  }

  Widget _buildStyledTitle(BuildContext context) {
    if (title == null) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    return DefaultTextStyle(
      style: theme.textTheme.h2.medium,
      child: title!,
    );
  }
}
