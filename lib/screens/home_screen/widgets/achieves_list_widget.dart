import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_and_testing/constants/app_colors.dart';
import 'package:training_and_testing/constants/app_images.dart';

class AchievesListWidget extends StatelessWidget {
  AchievesListWidget({super.key});
  final List<Map> _achivesList = [
    {'image': AppImages.speakerAchieves, 'lable': 'Best Speaker'},
    {'image': AppImages.writerAchieves, 'lable': 'Writer'},
    {'image': AppImages.allAchieves, 'lable': 'See all'}
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('My achieves ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
              const CircleAvatar(
                backgroundColor: AppColors.middleGray,
                radius: 11,
                child: Text(
                  '5',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              InkWell(
                  onTap: () => log('my achieves'),
                  child: SvgPicture.asset(AppImages.circleChevronRight)),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.darkgrey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _achivesList
                .map((e) => Column(
                      children: [
                        SvgPicture.asset(e['image']),
                        Text(
                          e['lable'],
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
