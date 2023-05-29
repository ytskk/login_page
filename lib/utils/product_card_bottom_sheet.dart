import 'package:bonus_api/bonus_api.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/utils/utils.dart';

/// Shows product info modal sheet with product info and add to cart
/// button (if product is available for purchase).
Future<void> showProductInfoModalSheet({
  required BuildContext context,
  required CatalogProductModel product,
  Widget? trailing,
  Widget? title,
  Widget? footer,
}) async {
  return showCustomModalBottomSheet<void>(
    context: context,
    trailing: trailing,
    title: title,
    child: ProductInfoModalSheet(
      product: product,
      footer: footer,
    ),
  );
}
