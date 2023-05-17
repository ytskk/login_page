import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class TrailerButtonTemplate extends StatelessWidget {
  const TrailerButtonTemplate({
    required this.title,
    this.iconAsset,
    this.onTap,
    super.key,
  });

  factory TrailerButtonTemplate.add({
    required String title,
    Function()? onTap,
  }) {
    return TrailerButtonTemplate(
      iconAsset: AppIcons.addIcon,
      onTap: onTap,
      title: title,
    );
  }

  final String title;

  final Function()? onTap;

  final String? iconAsset;

  @override
  Widget build(BuildContext context) {
    const type = ButtonType.secondary;

    const padding = EdgeInsets.symmetric(
      horizontal: padding24,
      vertical: padding6,
    );

    final child = Text(
      title,
      style: Theme.of(context).textTheme.bodyS.semibold,
    );

    if (iconAsset == null) {
      return BrandButton(
        padding: padding,
        type: type,
        onPressed: onTap,
        child: child,
      );
    } else {
      final icon = SvgAsset.squared(
        assetName: iconAsset!,
        size: iconSize10,
      );
      return BrandButton.icon(
        padding: padding,
        type: type,
        onPressed: onTap,
        icon: icon,
        child: child,
      );
    }
  }
}
