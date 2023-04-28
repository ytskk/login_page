import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/constants/generated/app_strings.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/coin_icon.dart';

/// {@template status_balance_widget}
/// Shows user balance info. Today changes and total balance.
/// {@endtemplate}
class BonusBalance extends StatelessWidget {
  /// {@macro status_balance_widget}
  const BonusBalance({
    required this.userBalance,
    super.key,
  });

  /// Today balance change. May be both positive and negative.
  final BalanceModel userBalance;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(padding16),
      child: Row(
        children: [
          // info balance.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.bonusBalance.tr(),
                  style: appTheme.textTheme.h2,
                ),
                const SizedBox(height: spacing4),
                Row(
                  children: [
                    Text(
                      '${AppStrings.today.tr()} ',
                      style: appTheme.textTheme.bodyS.light.light.copyWith(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    // today balance change.
                    Row(
                      children: [
                        Text(
                          <String>[
                            if (userBalance.todayChanges > 0) '+ ',
                            if (userBalance.todayChanges < 0) '- ',
                            userBalance.todayChanges.abs().toString()
                          ].join(),
                          style: appTheme.textTheme.bodyS.semibold.copyWith(
                            color: (userBalance.todayChanges > 0)
                                ? appTheme.colorScheme.yellow
                                : appTheme.colorScheme.white,
                          ),
                        ),
                        const SizedBox(width: spacing2),
                        CoinIcon(
                          size: iconSize10,
                          color: (userBalance.todayChanges > 0)
                              ? appTheme.colorScheme.yellow
                              : appTheme.colorScheme.white,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // balance value
          Row(
            children: [
              Text(
                '${userBalance.totalBalance}',
                style: appTheme.textTheme.hero.medium.copyWith(
                  fontSize: 40,
                  color: appTheme.colorScheme.yellow,
                ),
              ),
              const SizedBox(width: spacing6),
              CoinIcon(
                size: iconSize20,
                color: appTheme.colorScheme.yellow,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
