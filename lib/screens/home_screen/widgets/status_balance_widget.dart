import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/utils/utils.dart';

/// {@template status_balance_widget}
/// Shows user balance info. Today changes and total balance.
/// {@endtemplate}
class StatusBalance extends StatelessWidget {
  /// {@macro status_balance_widget}
  const StatusBalance({
    super.key,
    required this.todayBalanceChange,
    required this.totalBalance,
  });

  /// Today balance change. May be both positive and negative.
  final double todayBalanceChange;
  final double totalBalance;

  String get infoBalanceTitle => 'Bonus balance';
  String get infoBalanceToday => 'Today: ';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // info balance.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  infoBalanceTitle,
                  // TODO: h2
                  style: h2TextStyle.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      infoBalanceToday,
                      style: bodySTextStyle.light.copyWith(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    // today balance change.
                    Row(
                      children: [
                        Text(
                          '+$todayBalanceChange',
                          style: bodySTextStyle.semibold.copyWith(
                            color: AppColors.yellow,
                          ),
                        ),
                        const SizedBox(width: 2),
                        const CoinLogoWidget(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          // balance value
          Row(
            children: [
              Text(
                totalBalance.toStringAsFixed(0),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                  height: 1,
                  color: AppColors.yellow,
                ),
              ),
              const SizedBox(width: 6),
              const CoinLogoWidget(size: 20),
            ],
          ),
        ],
      ),
    );
  }
}

class CoinLogoWidget extends StatelessWidget {
  const CoinLogoWidget({
    super.key,
    this.size,
    this.color,
  });

  final double? size;
  final Color? color;

  get _size => size ?? 10;
  get _color => color ?? AppColors.yellow;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppImages.altenarCoinLogo,
      width: _size,
      height: _size,
      colorFilter: ColorFilter.mode(
        _color,
        BlendMode.srcIn,
      ),
    );
  }
}
