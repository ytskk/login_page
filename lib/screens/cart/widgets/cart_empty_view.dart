import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/router/router.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CartEmptyView extends StatelessWidget {
  const CartEmptyView({
    required this.balance,
    super.key,
  });

  final int balance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InfoList(
      icon: SvgAsset.squared(
        assetName: AppIcons.coloredCartIcon,
        color: theme.colorScheme.blue50,
      ),
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: tr(AppStrings.yourCart).toUpperCase(),
          style: theme.textTheme.hero,
          children: [
            TextSpan(
              text: '\n${tr(AppStrings.isEmpty).toUpperCase()}',
              style: theme.textTheme.hero.copyWith(
                color: Theme.of(context).colorScheme.blue50,
              ),
            ),
          ],
        ),
      ),
      content: Column(
        children: [
          Text(
            _buildInviteToSpendText,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyM.medium,
          ),
          const SizedBox(height: spacing16),
          Row(
            children: [
              Expanded(
                child: BrandButton(
                  onPressed: () => _onCatalogPressed(context),
                  child: Text(tr(AppStrings.goToCatalog)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String get _buildInviteToSpendText {
    return '${tr(
      AppStrings.youHaveNBonuses,
      namedArgs: {'n': balance.toString()},
    )}.\n${tr(AppStrings.spendBonusPoints)}';
  }

  void _onCatalogPressed(BuildContext context) =>
      context.pushNamed(AppRouteNames.catalog);
}
