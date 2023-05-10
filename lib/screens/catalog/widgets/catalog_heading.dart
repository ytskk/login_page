import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/screens/catalog/catalog.dart';
import 'package:training_and_testing/widgets/widgets.dart';

/// {@template catalog_heading}
/// Heading for the catalog screen. Contains the balance and filter button.
///
/// If [filtersAppliedCount] is not null and greater than 0, a badge with the
/// number of applied filters is shown. Don't worry, filter badge will be
/// clickable even if the badge is shown.
/// {@endtemplate}
class CatalogHeading extends StatelessWidget {
  /// {@macro catalog_heading}
  const CatalogHeading({
    required this.balance,
    this.onFilterPressed,
    this.filtersAppliedCount,
    this.padding,
    super.key,
  });

  final Widget balance;
  final int? filtersAppliedCount;
  final VoidCallback? onFilterPressed;
  final EdgeInsets? padding;

  static const _iconSize = iconSize24;

  static const _defaultPadding = EdgeInsets.only(
    left: padding16,
    right: padding16,
    bottom: padding24,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? _defaultPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          balance,

          // filter button with applied filter count
          Stack(
            alignment: Alignment.topRight,
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: onFilterPressed,
                icon: const SvgAsset.squared(
                  assetName: AppIcons.filterIcon,
                  size: _iconSize,
                ),
              ),
              if (filtersAppliedCount != null && filtersAppliedCount! > 0)
                Positioned(
                  right: _iconSize,
                  bottom: _iconSize,
                  // to ignore the pointer events on the badge. This is
                  // required to allow the user to tap the filter button
                  // even when the badge is shown.
                  child: IgnorePointer(
                    child: FilterCountBadge(
                      count: filtersAppliedCount!,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
