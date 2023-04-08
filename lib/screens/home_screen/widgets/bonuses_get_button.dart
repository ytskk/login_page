import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class BonusesGetButton extends StatelessWidget {
  const BonusesGetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 82, left: 16, right: 16, bottom: 24),
      child: ElevatedButton(
              onPressed: () => log('Get bonuses'),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(60),
                  backgroundColor: AppColors.blueMain,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  )),
              child: const Text(
                'Get bonuses',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
    );
  }
}