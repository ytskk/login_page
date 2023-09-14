import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/router/router.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CatalogAppBar extends StatelessWidget {
  const CatalogAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: CatalogHeading(
        padding: EdgeInsets.zero,
        balance: GetX<CatalogController>(
          builder: (controller) {
            return FutureBuilder(
              future: controller.userBalance.value,
              builder: (context, snapshot) {
                log(
                  'loading user balance: ${snapshot.connectionState}',
                  name: 'CatalogAppBar',
                );
                final isLoading =
                    snapshot.connectionState == ConnectionState.waiting;

                if (snapshot.hasError && !isLoading) {
                  return const SizedBox();
                }

                // final balance = snapshot.data;
                // return ShimmerLoader(
                //   shimmerBorderRadius: borderRadius8,
                //   isLoading: isLoading,
                //   child: BalanceInfo(balance: balance!.balance),
                // );
                return SizedBox();
              },
            );
          },
        ),
        onFilterPressed: () => context.pushNamed(AppRouteNames.catalogFilters),
      ),
    );
  }
}
