import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/constants/generated/app_strings.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/coin_icon.dart';
import 'package:training_and_testing/widgets/description_card.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class OperationsBlock extends StatelessWidget {
  const OperationsBlock({
    required this.homeScreenController,
    super.key,
  });

  final HomeScreenController homeScreenController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final userOperations = homeScreenController.userOperations.value;

      if (userOperations == null) return const SizedBox();

      final appTheme = Theme.of(context);

      Widget trailerBuilder(OperationItemModel operation) {
        return Row(
          children: [
            Text(
              <String>[
                if (operation.value > 0) '+ ',
                if (operation.value < 0) '- ',
                operation.value.abs().toString()
              ].join(),
              style: appTheme.textTheme.bodyS.semibold.copyWith(
                color: (operation.value > 0)
                    ? appTheme.colorScheme.yellow
                    : appTheme.colorScheme.white,
              ),
            ),
            CoinIcon(
              size: iconSize10,
              color: (operation.value > 0)
                  ? appTheme.colorScheme.yellow
                  : appTheme.colorScheme.white,
            )
          ],
        );
      }

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: padding20),
        child: Column(
          children: [
            // operations block header
            BlockHeader(
              title: AppStrings.lastOperations.tr(),
              label: userOperations.totalOperations,
              padding: const EdgeInsets.symmetric(horizontal: padding16),
            ),
            const SizedBox(height: spacing16),
            // Scroll operations block
            SizedBox(
              height: HomeScreenSized.operationsBlockHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: padding16),
                itemCount: userOperations.totalOperations,
                itemBuilder: (BuildContext context, int index) {
                  final operation = userOperations.operations[index];
                  return DescriptionCard(
                    description: operation.description,
                    date: operation.date.trd(context.locale),
                    width: HomeScreenSized.operationsBlockWidth,
                    backgroundColor: appTheme.colorScheme.grey90,
                    trailer: trailerBuilder(operation),
                  ).paddingOnly(left: (index != 0) ? padding8 : 0);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
