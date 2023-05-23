import 'package:flutter/material.dart';

typedef GroupedMap<T, E> = Map<T, List<E>>;

class SliverGroupedList<T, E> extends StatelessWidget {
  const SliverGroupedList({
    required this.items,
    required this.itemBuilder,
    this.groupHeaderBuilder,
    this.separator,
    super.key,
  });

  final GroupedMap<T, E> items;
  final Widget Function(T value, int count)? groupHeaderBuilder;
  final Widget Function(BuildContext context, E element, int index) itemBuilder;

  /// Separator between [itemBuilder]'s items.
  final Widget? separator;

  @override
  Widget build(BuildContext context) {
    return SliverList(
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
    );
  }

  // Calculates the total number of items in the list. Includes items count
  // for each group headers and separators.
  //
  // TODO: use that method in [SliverGroupedList].
  int calculateItemsCount(GroupedMap<T, E> items) {
    var itemsCount = 0;

    for (final key in items.keys) {
      itemsCount += items[key]!.length;

      if (groupHeaderBuilder != null) {
        itemsCount += 1;
      }

      if (separator != null) {
        itemsCount += items[key]!.length - 1;
      }
    }

    return itemsCount;
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
