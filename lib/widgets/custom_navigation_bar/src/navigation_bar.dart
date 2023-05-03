import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/app_styles.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/widgets/custom_navigation_bar/navigation_bar.dart';
import 'package:training_and_testing/widgets/svg_asset.dart';

class AppNavigationBar extends StatefulWidget {
  ///
  /// create a [AppNavigationBarState]
  ///
  const AppNavigationBar({
    required this.items,
    super.key,
    this.selectedColor = Colors.blue,
    this.unSelectedColor = Colors.grey,
    this.onTap,
    this.currentIndex = 0,
    this.iconSize = 24.0,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.borderRadius = Radius.zero,
    this.backgroundColor = Colors.white,
    this.opacity = 0.9,
  })  : assert(
          0 <= currentIndex && currentIndex < items.length,
          'Out of range index',
        );

  ///
  /// Border radius for navigation bar
  ///
  final Radius borderRadius;

  ///
  /// Item data in [AppNavigationBarItem]
  ///
  final List<AppNavigationBarItem> items;

  ///
  /// [Color] when [AppNavigationBarItem] is selected.
  ///
  /// default color is [Colors.blue].
  final Color selectedColor;

  ///
  /// [Color] when [AppNavigationBarItem] is not selected.
  ///
  /// default color is [Colors.grey].
  final Color unSelectedColor;

  ///
  /// callback function when item tapped
  ///
  final Function(int)? onTap;

  ///
  /// current index of navigation bar.
  ///
  final int currentIndex;

  ///
  /// size of icon.
  ///
  final double iconSize;

  ///
  /// Background color of [AppNavigationBarState]
  ///
  final Color backgroundColor;

  ///
  /// Background opacity of [AppNavigationBarState]
  /// default is [0.9]
  ///
  final double opacity;

  ///
  /// Padding of [AppNavigationBarState]
  ///
  final EdgeInsets padding;

  ///
  /// Margin of [AppNavigationBarState]
  ///
  final EdgeInsets margin;

  @override
  AppNavigationBarState createState() => AppNavigationBarState();
}

class AppNavigationBarState extends State<AppNavigationBar> {
  Widget _buildLabel(int index) {
    // unselected
    if (index != widget.currentIndex) {
      if (widget.items[index].title == null) {
        return Container();
      } else {
        return Text(
          widget.items[index].title ?? '',
          style: Theme.of(context).textTheme.captionTextStyle.copyWith(
                color: widget.unSelectedColor.withOpacity(0.5),
              ),
        );
      }
    } else {
      //selected
      if (widget.items[index].title == null) {
        return Container();
      } else {
        return Text(
          widget.items[index].selectedTitle ?? '',
          style: Theme.of(context).textTheme.captionTextStyle.copyWith(
                color: widget.selectedColor,
              ),
        );
      }
    }
  }

  Widget _buildBackground() {
    return Positioned.fill(
      child: SizedBox(
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.all(widget.borderRadius),
          child: ColoredBox(
            color: Colors.white24.withOpacity(0.08),
            child: BackdropFilter(
              // TODO(all): match the values
              filter: ImageFilter.blur(
                sigmaX: 8,
                sigmaY: 8,
              ),
              child: ColoredBox(
                color: widget.backgroundColor.withOpacity(widget.opacity),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTiles() {
    return Padding(
      padding: widget.padding,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            for (var i = 0; i < widget.items.length; i++)
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    widget.onTap!(i);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: padding6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildIcon(i),
                        const SizedBox(
                          height: spacing8,
                        ),
                        _buildLabel(i),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    return SizedBox.square(
      dimension: widget.iconSize,
      child: _CustomNavigationBarTile(
        selected: index == widget.currentIndex,
        item: widget.items[index],
        selectedColor: widget.selectedColor,
        unSelectedColor: widget.unSelectedColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: IntrinsicWidth(
        child: Stack(
          children: [
            _buildBackground(),
            _buildTiles(),
          ],
        ),
      ),
    );
  }
}

class _CustomNavigationBarTile extends StatelessWidget {
  const _CustomNavigationBarTile({
    this.selected,
    this.item,
    this.selectedColor,
    this.unSelectedColor,
  });

  final bool? selected;

  final AppNavigationBarItem? item;

  final Color? selectedColor;

  final Color? unSelectedColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgAsset(
          assetName: selected! ? item!.selectedIcon : item!.icon,
          color: selected! ? selectedColor! : unSelectedColor!,
        ),
        Positioned(
          right: -17,
          top: -17,
          child: BadgeText(
            show: item!.showBadge,
            count: item!.badgeCount,
          ),
        )
      ],
    );
  }
}
