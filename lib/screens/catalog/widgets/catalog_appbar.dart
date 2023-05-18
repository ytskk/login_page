import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/router/router.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CatalogAppBar extends StatelessWidget {
  const CatalogAppBar({
    required this.isLoading,
    required this.balance,
    super.key,
  });

  final bool isLoading;
  final int balance;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: CatalogHeading(
        padding: EdgeInsets.zero,
        balance: ShimmerLoader(
          shimmerBorderRadius: borderRadius8,
          isLoading: isLoading,
          child: BalanceInfo(balance: balance),
        ),
        onFilterPressed: () => context.pushNamed(AppRouteNames.catalogFilters),
      ),
    );
  }
}
