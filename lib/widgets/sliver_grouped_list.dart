import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';

class SliverGroupedList<T, E> extends StatelessWidget {
  const SliverGroupedList({
    required this.items,
    required this.itemBuilder,
    this.groupHeaderBuilder,
    this.separator,
    super.key,
  });

  final Map<T, List<E>> items;
  final Widget Function(T value, int count)? groupHeaderBuilder;
  final Widget Function(BuildContext context, E element, int index) itemBuilder;

  /// Separator between [itemBuilder]'s items.
  final Widget? separator;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: padding16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = items.keys.elementAt(index);

            if (groupHeaderBuilder != null) {
              return Column(
                children: [
                  groupHeaderBuilder!(item, items[item]!.length),
                  _buildCategoryItems(context, items[item]!),
                ],
              );
            }

            return _buildCategoryItems(context, items[item]!);
          },
          childCount: items.length,
        ),
      ),
    );
  }

  Widget _buildCategoryItems(
    BuildContext context,
    List<E> items,
  ) {
    return Column(
      children: [
        for (int ind = 0; ind < items.length; ind += 1) ...[
          itemBuilder(context, items[ind], ind),
          if (separator != null) separator!,
        ],
      ],
    );
  }
}
