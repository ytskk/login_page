import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgAsset.squared(
              assetName: AppIcons.coloredCartIcon,
              color: colorScheme.blue50,
            ),
            const SizedBox(height: spacing12),
            Text('Your cart is empty'),
            const CartProductCard(
              imageUrl: 'https://www.dup-lex.fr/images/product-7.jpg',
              title: 'Large white t-shirt with big Altenar logo',
              price: 240,
            ),
          ],
        ),
      ),
    );
  }
}

final _cartInfoText = {
  'text': 'Your cart',
  'translation_key': 'cart_info_text.your_cart',
  'decoration': {
    'style': 'uppercase',
    'weight': 'bold',
  },
  'children': [
    {
      'text': 'is empty',
      'translation_key': 'cart_info_text.is_empty',
      'decoration': {
        'color': 'blue50',
      },
    }
  ],
};
