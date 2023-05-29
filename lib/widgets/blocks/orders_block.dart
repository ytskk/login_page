import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/models/order_model.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class OrdersBlock extends StatelessWidget {
  const OrdersBlock({
    required this.homeScreenController,
    super.key,
    this.trailing,
  });

  final HomeScreenController homeScreenController;

  final Widget? trailing;

  Widget _buildOrderList(OrdersModel userOrders){
        return SizedBox(
            height: HomeScreenSized.orderBlockHeight,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: padding16),
              scrollDirection: Axis.horizontal,
              itemCount: userOrders.totalOrders + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return _PlaceOrderButton(
                    buttonWidth: HomeScreenSized.placeOrderButtonWidth,
                    textStyle: Theme.of(context).textTheme.buttonS,
                    contentColor: Theme.of(context).colorScheme.blue50,
                  );
                }
                return _PreviewOrderWidget(
                  userOrders.orders[index - 1],
                  HomeScreenSized.lableLineMaxWidth,
                );
              },
            ),
          ); 
        
      }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final userOrders = homeScreenController.userOrders.value;

      if (userOrders == null) return const SizedBox();

      return BlockTemplate(
        header: BlockHeader(
            title: AppStrings.myOrders.tr(),
            label: userOrders.totalOrders,
            padding: const EdgeInsets.symmetric(horizontal: padding16),
            trailing: trailing,
          ),
        body: _buildOrderList(userOrders),
      );
    });
  }
}

class _PlaceOrderButton extends StatelessWidget {
  const _PlaceOrderButton({
    required this.buttonWidth,
    this.contentColor,
    this.textStyle,
    this.iconSize,
  });

  final Color? contentColor;
  final TextStyle? textStyle;
  final double? iconSize;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return SizedBox(
      width: buttonWidth,
      child: RoundedRectangleBox(
        innerPadding: const EdgeInsets.symmetric(horizontal: padding24),
        backgroundColor: appTheme.colorScheme.grey70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgAsset.squared(
              assetName: AppIcons.addCircleOutlineIcon,
              color: contentColor,
              size: iconSize,
            ),
            const SizedBox(height: spacing8),
            Text(
              AppStrings.placeNewOrder.tr(),
              style: textStyle?.copyWith(color: contentColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviewOrderWidget extends StatelessWidget {
  const _PreviewOrderWidget(
    this.order,
    this.lableLineMaxWidth,
  );

  final OrderModel order;
  final double lableLineMaxWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(left: padding8),
      child: RoundedRectangleBox(
        innerPadding: const EdgeInsets.all(padding16),
        backgroundColor: theme.colorScheme.grey70,
        child: Row(
          children: [
            const SvgAsset(assetName: AppIcons.speakerAchieves),
            Padding(
              padding: const EdgeInsets.only(left: padding16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Order date display
                  Text(
                    order.orderDated.trd(context.locale),
                    style: theme.textTheme.bodyS.semibold.copyWith(
                      color: theme.colorScheme.white.withOpacity(0.5),
                    ),
                  ),
                  // Order label with the count of items
                  _buildOrderLableRow(context, lableLineMaxWidth, order),
                  const SizedBox(height: spacing8),
                  // Order status display
                  StatusBadge(
                    text: order.orderStatus.trEnum(),
                    type: (order.orderStatus == OrderStatus.delivered)
                        ? StatusBadgeType.positive
                        : (order.orderStatus == OrderStatus.canceled)
                            ? StatusBadgeType.negative
                            : StatusBadgeType.waiting,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOrderLableRow(
    BuildContext context,
    double lableLineMaxWidth,
    OrderModel order,
  ) {
    final theme = Theme.of(context);

    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: lableLineMaxWidth),
          child: Text(
            order.items[0].name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style:
                theme.textTheme.bodyM.copyWith(color: theme.colorScheme.white),
          ),
        ),
        if (order.totalItems > 1) ...[
          const SizedBox(width: spacing8),
          Text(
            ' +${order.totalItems - 1}',
            style:
                theme.textTheme.bodyM.copyWith(color: theme.colorScheme.white),
          )
        ]
      ],
    );
  }
}
