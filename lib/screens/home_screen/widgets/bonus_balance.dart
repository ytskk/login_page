import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/coin_icon.dart';

/// {@template status_balance_widget}
/// Shows user balance info. Today changes and total balance.
/// {@endtemplate}
class BonusBalance extends StatelessWidget {
  /// {@macro status_balance_widget}
  const BonusBalance({
    super.key,
    required this.todayBalanceChange,
    required this.totalBalance,
  });

  /// Today balance change. May be both positive and negative.
  final int todayBalanceChange;
  final int totalBalance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding16),
      child: Row(
        children: [
          // info balance.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  AppStrings.infoBalanceTitle,
                  style: h2TextStyle,
                ),
                const SizedBox(height: spacing4),
                Row(
                  children: [
                    Text(
                      '${AppStrings.infoBalanceToday}: ',
                      style: bodySTextStyle.light.copyWith(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    // today balance change.
                    Row(
                      children: [
                        Text(
                          '$todayBalanceChange',
                          style: bodySTextStyle.semibold.copyWith(
                            color: AppColors.yellow,
                          ),
                        ),
                        const SizedBox(width: spacing2),
                        const CoinIcon(
                          size: iconSize10,
                          color: AppColors.yellow,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: spacing24),
          // balance value
          Row(
            children: [
              Text(
                totalBalance.toStringAsFixed(0),
                style: heroTextStyle.medium.copyWith(
                  fontSize: 40,
                  color: AppColors.yellow,
                ),
              ),
              const SizedBox(width: spacing6),
              const CoinIcon(
                size: iconSize20,
                color: AppColors.yellow,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
