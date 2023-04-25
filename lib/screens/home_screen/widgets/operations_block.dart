import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/constants/generated/app_strings.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
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

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: padding20),
        child: Column(
          children: [
            // Orders block header
            BlockHeader(
              title: AppStrings.lastOperations.tr(),
              label: userOperations.totalOperations,
              padding: const EdgeInsets.symmetric(horizontal: padding16),
            ),
            const SizedBox(height: spacing16),
            // Scroll orders block
            SizedBox(
              height: HomeScreenSized.operationsBlockHeight,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: padding16),
                  itemCount: userOperations.totalOperations,
                  itemBuilder: (BuildContext context, int index) {
                    final operation = userOperations.operations[index];
                    return PreviewOperationWidget(
                            operation, HomeScreenSized.operationsBlockWidth)
                        .paddingOnly(left: (index != 0) ? padding8 : 0);
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
    final appTheme = Theme.of(context);
    return SizedBox(
        width: operationsBlockWidth,
        child: RoundedRectangleBox(
          innerPadding: const EdgeInsets.all(padding16),
          backgroundColor: appTheme.colorScheme.grey90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Operation date
                  Text(operation.date.trd(context),
                      style: appTheme.textTheme.bodyS.light.copyWith(
                          color: appTheme.colorScheme.white.withOpacity(0.5))),
                  const Expanded(child: SizedBox()),

                  // Operation value
                  Text(
                      <String>[
                        if (operation.value > 0) '+ ',
                        if (operation.value < 0) '- ',
                        operation.value.abs().toString()
                      ].join(),
                      style: appTheme.textTheme.bodyS.semibold.copyWith(
                          color: (operation.value > 0)
                              ? appTheme.colorScheme.yellow
                              : appTheme.colorScheme.white)),
                  CoinIcon(
                    size: iconSize10,
                    color: (operation.value > 0)
                        ? appTheme.colorScheme.yellow
                        : appTheme.colorScheme.white,
                  )
                ],
              ),
              // Operation description
              Text(
                operation.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: appTheme.textTheme.bodyS.light
                    .copyWith(color: appTheme.colorScheme.white),
              )
            ],
          ),
        ));
  }
}
