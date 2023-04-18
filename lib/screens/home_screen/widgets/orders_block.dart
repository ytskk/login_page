import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class OrdersBlock extends StatelessWidget {
  OrdersBlock({
    super.key,
    this.ordersCount,
  });

  final int? ordersCount;

  final List<Map<String, String>> _ordersList = [
    {
      'image': AppIcons.blueCup,
      'lable': 'Blue cup with Altenar logo',
      'date': '12.12.2012',
      'status': 'Waiting for delivery',
    },
    {
      'image': AppIcons.blueCup,
      'lable': 'Blue cup with Altenar logo',
      'date': '12.12.2015',
      'status': 'Delivered',
    },
    {
      'image': AppIcons.blueCup,
      'lable': 'Blue cup with Altenar logo',
      'date': '12.12.2015',
      'status': 'Waiting for delivery',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: largePadding),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: mediumPadding),
            child: BlockHeader(
              title: AppStrings.myOrders,
              label: ordersCount,
            ),
          ),
          const SizedBox(height: mediumSpacing2),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.width * 0.26),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _ordersList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return PlaceOrderButton(
                      textStyle: buttonSTextStyle,
                      contentColor: AppColors.blueMain,
                    );
                  }
                  return PreviewOrderWidget(
                    countItems: 3,
                    date: '12.12.2222',
                    image: '',
                    name: 'asdkasdsfsdfsdfsdfsdfsdfsdfds',
                    status: 'waiting',
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton(
      {super.key, this.contentColor, this.textStyle, this.iconSize});

  final Color? contentColor;
  final TextStyle? textStyle;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: mediumPadding),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.30),
      child: RoundedRectangleBox(
        innerPadding: const EdgeInsets.symmetric(horizontal: largePadding),
        backgroundColor: AppColors.darkGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgAsset.squared(
              assetName: AppIcons.addCircleOutlineIcon,
              color: contentColor,
              size: iconSize,
            ),
            const SizedBox(height: mediumSpacing1),
            Text(
              AppStrings.placeNewOrder,
              style: textStyle?.copyWith(color: contentColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class PreviewOrderWidget extends StatelessWidget {
  const PreviewOrderWidget(
      {super.key,
      required this.date,
      required this.name,
      required this.image,
      required this.status,
      required this.countItems});

  final String date;
  final String name;
  final String image;
  final String status;
  final int countItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: smallPadding2),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.80),
      child: RoundedRectangleBox(
          innerPadding: const EdgeInsets.all(mediumPadding),
          backgroundColor: AppColors.grey,
          child: Row(
            children: [
              SvgAsset(assetName: AppIcons.speakerAchieves),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(date,
                        style: bodySTextStyle.semibold
                            .copyWith(color: AppColors.white.withOpacity(0.5))),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style:
                                bodyMTextStyle.copyWith(color: AppColors.white),
                          ),
                        ),
                        if (countItems > 1)
                          Text(
                            '+${countItems - 1}',
                            style:
                                bodyMTextStyle.copyWith(color: AppColors.white),
                          )
                      ],
                    ),
                    const SizedBox(height: mediumSpacing1),
                    Row(
                      children: const [StatusBadge(text: 'daad')],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
