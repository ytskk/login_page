import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/app_styles.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class TagBadge extends StatelessWidget {
  const TagBadge({
    required this.child,
    required this.isSelected,
    this.onPressed,
    super.key,
  });

  final Widget child;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final backgroundColor =
        isSelected ? theme.colorScheme.primary : theme.colorScheme.grey50;

    return GestureDetector(
      onTap: onPressed,
      child: AnimatedOpacity(
        duration: const Duration(
          milliseconds: 320,
        ),
        curve: Curves.easeIn,
        opacity: onPressed == null ? 0.5 : 1,
        child: InfoBadge(
          padding: const EdgeInsets.symmetric(
            horizontal: padding16,
            vertical: padding10,
          ),
          borderRadius: 100,
          backgroundColor: backgroundColor,
          textStyle: theme.textTheme.buttonS,
          child: child,
        ),
      ),
    );
  }
}
