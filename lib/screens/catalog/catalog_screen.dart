import 'dart:async';

import 'package:bonus_api/bonus_api.dart';
import 'package:bonus_repository/bonus_repository.dart';
import 'package:cache_client/cache_client.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      // init: CatalogController(
      //   catalogApiClient: RemoteCatalogApi(
      //     dio: Dio(
      //       BaseOptions(
      //         // android base url
      //         // baseUrl: 'http://10.0.2.2:8080/',
      //         // ios base url
      //         baseUrl: 'http://localhost:8080/',
      //       ),
      //     ),
      //   ),
      //   bonusesApiClient: GetRequests(
      //     dioClient: DioClient.client(
      //       baseUrl: BonusesApiConfig.baseUrl,
      //       debug: true,
      //     ),
      //   ),
      // ),
      init: CatalogController(
        catalogRepository: CatalogBonusRepository(
          bonusesRepository: NetworkCacheableBonusRepository(
            cacheClient: InMemoryCacheClient(),
            bonusApi: BonusApiClient(
              Dio(
                BaseOptions(
                  // //  android base url
                  // baseUrl: 'http://10.0.2.2:8080/',
                  // // ios base url
                  baseUrl: 'http://localhost:8081/',
                ),
              ),
            ),
          ),
        ),
      ),
      filter: (_) => false,
      builder: (_) => const CatalogScreenView(),
    );
  }
}

class CatalogScreenView extends StatelessWidget {
  const CatalogScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            GetBuilder<CatalogController>(
              builder: (controller) {
                print('updating balance widget');
                return CatalogAppBar(
                  isLoading: true,
                  balance: controller.balance,
                );
              },
            ),
            SliverStickyHeader(
              header: const CatalogCategoriesTabsView(),
              sliver: const CatalogProductsListView(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: spacing80),
            ),
          ],
        ),
      ),
    );
  }
}
