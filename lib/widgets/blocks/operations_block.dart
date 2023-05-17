import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/description_card.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class OperationsBlock extends StatelessWidget {
  const OperationsBlock({
    required this.homeScreenController,
    super.key,
    this.trailing,
    this.padding,
  });

  final HomeScreenController homeScreenController;

  final Widget? trailing;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final userOperations = homeScreenController.userOperations.value;

      if (userOperations == null) return const SizedBox();

      final appTheme = Theme.of(context);

      Widget trailerCardBuilder(OperationItemModel operation) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
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
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.right,
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

      Widget buildOperationList() {
        return SizedBox(
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
                trailer: trailerCardBuilder(operation),
              ).paddingOnly(left: (index != 0) ? padding8 : 0);
            },
          ),
        );
      }

      return BlockTemplate(
        header: BlockHeader(
          title: AppStrings.lastOperations.tr(),
          label: userOperations.totalOperations,
          padding: const EdgeInsets.symmetric(horizontal: padding16),
          trailing: trailing,
        ),
        body: buildOperationList(),
      );
    });
  }
}
