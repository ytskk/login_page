import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_and_testing/constants/app_colors.dart';
import '../../../constants/app_icons.dart';

class MyOrdersListWidget extends StatelessWidget {
  MyOrdersListWidget({super.key});
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
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 48, bottom: 16, left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('My orders ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  )),
              const CircleAvatar(
                backgroundColor: AppColors.middleGrey,
                radius: 11,
                child: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              InkWell(
                  onTap: () => log('My orders'),
                  child: SvgPicture.asset(AppIcons.circleChevronRight)),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16),
          height: 110,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: _ordersList.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) return const NewOrderButton();
                return PreviewOrderWidget(order: _ordersList[index - 1]);
              }),
        ),
      ],
    );
  }
}

class NewOrderButton extends StatelessWidget {
  const NewOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => log('New order'),
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
        child: SizedBox(
          width: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.add_circle_outline,
                color: AppColors.blueMain,
                size: 28,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'Place new order',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.blueMain, fontSize: 14),
                ),
              )
            ],
          ),
        ));
  }
}

class PreviewOrderWidget extends StatelessWidget {
  final Map<String, String> order;
  const PreviewOrderWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ElevatedButton(
          onPressed: () => log('click order'),
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )),
          child: SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                    order['image'] ?? '',
                    // width: 80.8,
                    // height: 64,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order['date'] ?? '',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        order['lable'] ?? '',
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(
                          top: 2, bottom: 3, left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: AppColors.smokeGrey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        order['status'] ?? '',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
