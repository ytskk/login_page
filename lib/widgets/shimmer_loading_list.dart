import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/widgets/widgets.dart';

/// {@template shimmer_loading_list}
/// Widget that shows list of shimmer loading items. It's useful when you need
/// to show loading state of list of items. Recommended to use with
/// [ShimmerLoader] widget.
///
/// You can customize shown items by passing [item] parameter, else default
/// item will be used (see [_defaultChild]).
/// {@endtemplate}
class ShimmerLoadingList extends StatelessWidget {
  /// {@macro shimmer_loading_list}
  const ShimmerLoadingList({
    super.key,
    this.itemCount = 4,
    this.shrinkWrap = true,
    this.item,
  });

  final int itemCount;
  final bool shrinkWrap;
  final Widget? item;

  static const _defaultChild = SizedBox(
    height: 64,
    child: Shimmer(
      borderRadius: borderRadius8,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final child = item ?? _defaultChild;

    return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: const ScrollPhysics(),
      itemBuilder: (_, __) => child,
      itemCount: itemCount,
      separatorBuilder: (_, __) => const SizedBox(height: spacing8),
    );
  }
}

class ShimmerLoadingSliverList extends StatelessWidget {
  const ShimmerLoadingSliverList({
    required this.itemCount,
    this.item,
    super.key,
  });

  final int itemCount;
  final Widget? item;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          // should be right ;)
          if (index.isOdd) {
            return _buildSeparator();
          }

          return item;
        },
        childCount: itemCount + itemCount - 1,
      ),
    );
  }

  Widget _buildSeparator() {
    return const SizedBox(height: spacing8);
  }
}
