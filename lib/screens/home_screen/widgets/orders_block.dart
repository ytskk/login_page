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
import '../../../models/order_model.dart';

class OrdersBlock extends StatelessWidget {
  const OrdersBlock({
    super.key,
    required this.homeScreenController,
  });

  final HomeScreenController homeScreenController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final userOrders = homeScreenController.userOrders.value;

      if (userOrders == null) return const SizedBox();

      final appTheme = Theme.of(context);

      return Padding(
          padding: const EdgeInsets.symmetric(vertical: padding20),
          child: Column(
            children: [
              // Header
              BlockHeader(
                title: AppStrings.myOrders.tr(),
                label: userOrders.totalOrders,
                padding: const EdgeInsets.symmetric(horizontal: padding16),
              ),
              const SizedBox(height: spacing16),
              // Scroll
              SizedBox(
                height: HomeScreenSized.orderBlockHeight,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: padding16),
                  scrollDirection: Axis.horizontal,
                  itemCount: userOrders.totalOrders + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return _PlaceOrderButton(
                        buttonWidth: HomeScreenSized.placeOrderButtonWidth,
                        textStyle: appTheme.textTheme.buttonS,
                        contentColor: appTheme.colorScheme.blue50,
                      );
                    }
                    return _PreviewOrderWidget(
                      userOrders.orders[index - 1],
                      HomeScreenSized.lableLineMaxWidth,
                    );
                  },
                ),
              ),
            ],
          ));
    });
  }
}

class _PlaceOrderButton extends StatelessWidget {
  const _PlaceOrderButton({
    this.contentColor,
    this.textStyle,
    this.iconSize,
    required this.buttonWidth,
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
  _PreviewOrderWidget(this.order, this.lableLineMaxWidth);

  final OrderModel order;
  final double lableLineMaxWidth;

  late ThemeData _appTheme;

  @override
  Widget build(BuildContext context) {
    _appTheme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(left: padding8),
      child: RoundedRectangleBox(
          innerPadding: const EdgeInsets.all(padding16),
          backgroundColor: _appTheme.colorScheme.grey70,
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
                      order.orderDated.trd(context),
                      style: _appTheme.textTheme.bodyS.semibold.copyWith(
                        color: _appTheme.colorScheme.white.withOpacity(0.5),
                      ),
                    ),
                    // Оrder lable with the count of items
                    _buildOrderLableRow(lableLineMaxWidth, order),
                    const SizedBox(height: spacing8),
                    // Order status display
                    StatusBadge(
                        text: order.orderStatus.trEnum(),
                        type: (order.orderStatus == OrderStatus.delivered)
                            ? StatusBadgeType.positive
                            : (order.orderStatus == OrderStatus.canceled)
                                ? StatusBadgeType.negative
                                : StatusBadgeType.waiting)
                  ],
                ),
              )
            ],
          )),
    );
  }

  _buildOrderLableRow(lableLineMaxWidth, order) {
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: lableLineMaxWidth),
          child: Text(
            order.items[0].name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: _appTheme.textTheme.bodyM
                .copyWith(color: _appTheme.colorScheme.white),
          ),
        ),
        if (order.totalItems > 1) ...[
          const SizedBox(width: spacing8),
          Text(' +${order.totalItems - 1}',
              style: _appTheme.textTheme.bodyM
                  .copyWith(color: _appTheme.colorScheme.white))
        ]
      ],
    );
  }
}
