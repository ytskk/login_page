import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_and_testing/constants/app_colors.dart';

import '../../../constants/app_icons.dart';

class LastOperationsListWidget extends StatelessWidget {
  LastOperationsListWidget({super.key});
  final List<Map<String, String>> _operationList = [
    {
      'value': '+ 150',
      'date': '12.12.2015',
      'description': 'Blue cup with Altenar logo',
    },
    {
      'value': '- 150',
      'date': '12.12.2015',
      'description': 'Blue cup with Altenar logo',
    },
    {
      'value': '+ 200',
      'date': '12.12.2015',
      'description': 'Blue cup with Altenar logo',
    },
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
              const Text('Last operations ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
              const CircleAvatar(
                backgroundColor: AppColors.middleGrey,
                radius: 11,
                child: Text(
                  '10',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              InkWell(
                  onTap: () => log('Last operations'),
                  child: SvgPicture.asset(AppIcons.circleChevronRight)),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16),
          height: 95,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: _operationList.length,
              itemBuilder: (BuildContext context, int index) {
                return LastOperationsWidget(operation: _operationList[index]);
              }),
        ),
      ],
    );
  }
}

class LastOperationsWidget extends StatelessWidget {
  final Map<String, String> operation;
  const LastOperationsWidget({super.key, required this.operation});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ElevatedButton(
            onPressed: () => log('operation'),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(174),
                padding: const EdgeInsets.all(16),
                backgroundColor: AppColors.darkGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      operation['date'] ?? '00.00.0000',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      operation['value'] ?? '0',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: ((operation['value'] != null) &&
                                  (operation['value']!.contains('+')))
                              ? AppColors.yellow
                              : Colors.white),
                    ),
                    ((operation['value'] != null) &&
                            (operation['value']!.contains('+')))
                        ? SvgPicture.asset(
                            AppIcons.coinIcon,
                            width: 10,
                            height: 10,
                          )
                        : SvgPicture.asset(
                            AppIcons.coinIcon,
                            width: 10,
                            height: 10,
                          ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    operation['description'] ?? '',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        height: 1.5,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            )));
  }
}
