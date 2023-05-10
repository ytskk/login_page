import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class BalanceInfo extends StatelessWidget {
  const BalanceInfo({
    required this.balance,
    super.key,
  });

  final int balance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Text(
          '${tr(AppStrings.yourBalance)}:',
          style: theme.textTheme.h3.medium.copyWith(
            color: theme.colorScheme.backgroundInverse.withOpacity(0.4),
          ),
        ),
        const SizedBox(width: spacing4),
        Text(
          balance.toString(),
          style: theme.textTheme.h3.medium.copyWith(
            color: theme.colorScheme.yellow,
          ),
        ),
        const SizedBox(width: spacing4),
        CoinIcon(
          color: theme.colorScheme.yellow,
          size: iconSize16,
        ),
      ],
    );
  }
}
