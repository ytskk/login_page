import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/constants/generated/app_strings.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

import '../../../controllers/controllers.dart';
import '../../../models/models.dart';
import '../../../widgets/coin_icon.dart';

class OperationsBlock extends StatelessWidget {
  const OperationsBlock({
    super.key,
    required this.homeScreenController,
  });

  final HomeScreenController homeScreenController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final userOperations = homeScreenController.userOperations.value;

      if (userOperations == null) return const SizedBox();

      const double operationsBlockHeight = 91;
      const double operationsBlockWidth = 170;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: padding20),
        child: Column(
          children: [
            // Orders block header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: padding16),
              child: BlockHeader(
                title: LocaleKeys.last_operations.tr(),
                label: userOperations.totalOperations,
              ),
            ),
            const SizedBox(height: spacing16),
            // Scroll orders block
            SizedBox(
              height: operationsBlockHeight,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userOperations.totalOperations,
                  itemBuilder: (BuildContext context, int index) {
                    final operation = userOperations.operations[index];
                    return PreviewOperationWidget(
                            operation, operationsBlockWidth)
                        .paddingOnly(left: (index == 0) ? padding16 : 0);
                  }),
            ),
          ],
        ),
      );
    });
  }
}

class PreviewOperationWidget extends StatelessWidget {
  const PreviewOperationWidget(
    this.operation,
    this.operationsBlockWidth, {
    super.key,
  });

  final OperationItemModel operation;
  final double operationsBlockWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: padding8),
        width: operationsBlockWidth,
        child: RoundedRectangleBox(
          innerPadding: const EdgeInsets.all(padding16),
          backgroundColor: AppColors.darkGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Operation date
                  Text(operation.date.trd(context),
                      style: bodySTextStyle.light
                          .copyWith(color: AppColors.white.withOpacity(0.5))),
                  const Expanded(child: SizedBox()),

                  // Operation value
                  Text('${operation.value}',
                      style: bodySTextStyle.semibold.copyWith(
                          color: (operation.value > 0)
                              ? AppColors.yellow
                              : AppColors.white)),
                  CoinIcon(
                    size: iconSize10,
                    color: (operation.value > 0)
                        ? AppColors.yellow
                        : AppColors.white,
                  )
                ],
              ),
              // Operation description
              Text(
                operation.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: bodySTextStyle.light.copyWith(color: AppColors.white),
              )
            ],
          ),
        ));
  }
}
