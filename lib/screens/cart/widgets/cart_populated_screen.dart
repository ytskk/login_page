import 'dart:developer';

import 'package:catalog_api/catalog_api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CartPopulatedScreen extends StatelessWidget {
  const CartPopulatedScreen({
    required this.cartProducts,
    super.key,
  });

  final List<CartProductModel> cartProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: _onDeleteAllPressed,
            child: Text(
              tr(AppStrings.deleteAll),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CartFloatingCheckoutButton(
        onPressed: () {},
      ),
      body: ListView.separated(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          final cartProduct = cartProducts[index];

          return _buildCartProductCardItem(context, cartProduct);
        },
        separatorBuilder: (_, __) => const SizedBox(height: spacing8),
      ),
    );
  }

  Future<void> _onDeleteAllPressed() async {
    log('Intent to delete all products from cart');
    await Future<void>.delayed(const Duration(seconds: 1));
  }

  CartProductCard _buildCartProductCardItem(
    BuildContext context,
    CartProductModel cartProduct,
  ) {
    return CartProductCard(
      onCardPressed: () {
        // showProductInfoModalSheet(
        //   context: context,
        //   trailing: const CloseTextButton(),
        //   product: cartProduct,
        //   footer: _buildProductDeleteFromCartButton(cartProduct),
        // );
      },
      imageUrl: cartProduct.imageUrl,
      title: cartProduct.title,
      price: cartProduct.price!,
      quantity: cartProduct.quantity,
      selectedOption: cartProduct.option,
      onRemovePressed: () => _removeProductFromCart(cartProduct),
      onQuantityChanged: () {
        log('quantity changed');
      },
      onOptionChanged: () {
        log('option changed');
      },
    );
  }

  Row _buildProductDeleteFromCartButton(
    CartProductModel cartProduct,
  ) {
    return Row(
      children: [
        Expanded(
          child: BrandButton(
            onPressed: () => _removeProductFromCart(cartProduct),
            type: ButtonType.secondary,
            child: Text(
              tr(AppStrings.deleteFromCart),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _removeProductFromCart(ProductModel product) async {
    log(
      'Intent to remove product from cart: ${product.title}',
    );
  }
}

class CartFloatingCheckoutButton extends StatelessWidget {
  const CartFloatingCheckoutButton({
    this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing16),
      child: Row(
        children: [
          Expanded(
            child: BrandButton(
              onPressed: onPressed,
              size: ButtonSize.large,
              child: Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
