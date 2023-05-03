import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/app_styles.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/badges/badges.dart';

class BadgeText extends StatelessWidget {
  const BadgeText({
    super.key,
    this.count,
    this.show,
  });

  // counter showed in notification badge
  // set to 0 will hide notification badge
  final int? count;

  final bool? show;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return show! && count != 0
        ? InfoBadge(
          backgroundColor: appTheme.colorScheme.blue50,
          padding: const EdgeInsets.symmetric(
            vertical: padding3,
            horizontal: padding8,
          ),
          borderRadius: borderRadius100,
          child: Text(
            count! > 10 ? '10+' : '$count',
            style: appTheme.textTheme.captionTextStyle,
            textAlign: TextAlign.center,
          ),
        )
        : Container();
  }
}
