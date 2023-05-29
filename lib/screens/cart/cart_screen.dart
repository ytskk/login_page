import 'package:flutter/material.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/screens/screens.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Future<List<CartProductModel>> _cartProductsFuture;

  Future<List<CartProductModel>> fetchCartProducts() async {
    await Future<void>.delayed(const Duration(seconds: 1));

    return cartProducts.map(CartProductModel.fromJson).toList();
  }

  @override
  void initState() {
    super.initState();

    _cartProductsFuture = fetchCartProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CartProductModel>>(
      future: _cartProductsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }

        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong'),
            ),
          );
        }

        final cartProducts = snapshot.data!;

        if (cartProducts.isEmpty) {
          const balance = 2150;
          return CartEmptyScreen(balance: balance);
        }

        return CartPopulatedScreen(
          cartProducts: cartProducts,
        );
      },
    );
  }
}

final cartProducts = [
  {
    "id": "353768da-94cf-4599-82ac-194d4972d93f",
    "title": "Large white t-shirt with big Altenar logo",
    "imageUrl": "https://www.dup-lex.fr/images/product-7.jpg",
    "description":
        "This white t-shirt features a vibrant logo on the front, adding a pop of color to your look. Made with high-quality cotton, it feels soft and comfortable against your skin. Perfect for casual occasions or just lounging around at home, this t-shirt is sure to become an essential in your wardrobe.",
    "price": 240,
    "status": 0,
    "isNew": true,
    "categorySlug": "clothes",
    "categoryName": "Clothes",
    "quantity": 1,
    "option": "L"
  },
  {
    "id": "8ab211a3-c72e-40e3-9024-c1a514a2af6f",
    "title": "Large blue cup with big Altenar logo",
    "imageUrl": "https://www.mbsopt.com/wp-content/uploads/2019/09/BLUE.png",
    "description":
        "The blue cup with logo is a durable ceramic mug that comes in a deep shade of blue. The logo is imprinted on the side of the cup, adding a touch of personalization to your morning coffee routine. Whether you're sipping hot cocoa or tea, this cup will keep your beverage warm and toasty for longer periods of time. It has a comfortable grip handle that fits easily in your hand and prevents slipping while drinking. This cup with logo is perfect for gifts, giveaways, or simply enjoying yourself!",
    "price": 240,
    "status": 0,
    "isNew": false,
    "categorySlug": "dishes",
    "categoryName": "Dishes",
    "quantity": 2
  },
  {
    "id": "353768da-94cf-4599-82ac-194d4972d93f",
    "title": "Large white t-shirt with big Altenar logo",
    "imageUrl": "https://www.dup-lex.fr/images/product-7.jpg",
    "description":
        "This white t-shirt features a vibrant logo on the front, adding a pop of color to your look. Made with high-quality cotton, it feels soft and comfortable against your skin. Perfect for casual occasions or just lounging around at home, this t-shirt is sure to become an essential in your wardrobe.",
    "price": 240,
    "status": 0,
    "isNew": true,
    "categorySlug": "clothes",
    "categoryName": "Clothes",
    "quantity": 1,
    "option": "L"
  },
  {
    "id": "8ab211a3-c72e-40e3-9024-c1a514a2af6f",
    "title": "Large blue cup with big Altenar logo",
    "imageUrl": "https://www.mbsopt.com/wp-content/uploads/2019/09/BLUE.png",
    "description":
        "The blue cup with logo is a durable ceramic mug that comes in a deep shade of blue. The logo is imprinted on the side of the cup, adding a touch of personalization to your morning coffee routine. Whether you're sipping hot cocoa or tea, this cup will keep your beverage warm and toasty for longer periods of time. It has a comfortable grip handle that fits easily in your hand and prevents slipping while drinking. This cup with logo is perfect for gifts, giveaways, or simply enjoying yourself!",
    "price": 240,
    "status": 0,
    "isNew": false,
    "categorySlug": "dishes",
    "categoryName": "Dishes",
    "quantity": 2
  },
  {
    "id": "353768da-94cf-4599-82ac-194d4972d93f",
    "title": "Large white t-shirt with big Altenar logo",
    "imageUrl": "https://www.dup-lex.fr/images/product-7.jpg",
    "description":
        "This white t-shirt features a vibrant logo on the front, adding a pop of color to your look. Made with high-quality cotton, it feels soft and comfortable against your skin. Perfect for casual occasions or just lounging around at home, this t-shirt is sure to become an essential in your wardrobe.",
    "price": 240,
    "status": 0,
    "isNew": true,
    "categorySlug": "clothes",
    "categoryName": "Clothes",
    "quantity": 1,
    "option": "L"
  },
  {
    "id": "8ab211a3-c72e-40e3-9024-c1a514a2af6f",
    "title": "Large blue cup with big Altenar logo",
    "imageUrl": "https://www.mbsopt.com/wp-content/uploads/2019/09/BLUE.png",
    "description":
        "The blue cup with logo is a durable ceramic mug that comes in a deep shade of blue. The logo is imprinted on the side of the cup, adding a touch of personalization to your morning coffee routine. Whether you're sipping hot cocoa or tea, this cup will keep your beverage warm and toasty for longer periods of time. It has a comfortable grip handle that fits easily in your hand and prevents slipping while drinking. This cup with logo is perfect for gifts, giveaways, or simply enjoying yourself!",
    "price": 240,
    "status": 0,
    "isNew": false,
    "categorySlug": "dishes",
    "categoryName": "Dishes",
    "quantity": 2
  },
  {
    "id": "353768da-94cf-4599-82ac-194d4972d93f",
    "title": "Large white t-shirt with big Altenar logo",
    "imageUrl": "https://www.dup-lex.fr/images/product-7.jpg",
    "description":
        "This white t-shirt features a vibrant logo on the front, adding a pop of color to your look. Made with high-quality cotton, it feels soft and comfortable against your skin. Perfect for casual occasions or just lounging around at home, this t-shirt is sure to become an essential in your wardrobe.",
    "price": 240,
    "status": 0,
    "isNew": true,
    "categorySlug": "clothes",
    "categoryName": "Clothes",
    "quantity": 1,
    "option": "L"
  },
  {
    "id": "8ab211a3-c72e-40e3-9024-c1a514a2af6f",
    "title": "Large blue cup with big Altenar logo",
    "imageUrl": "https://www.mbsopt.com/wp-content/uploads/2019/09/BLUE.png",
    "description":
        "The blue cup with logo is a durable ceramic mug that comes in a deep shade of blue. The logo is imprinted on the side of the cup, adding a touch of personalization to your morning coffee routine. Whether you're sipping hot cocoa or tea, this cup will keep your beverage warm and toasty for longer periods of time. It has a comfortable grip handle that fits easily in your hand and prevents slipping while drinking. This cup with logo is perfect for gifts, giveaways, or simply enjoying yourself!",
    "price": 240,
    "status": 0,
    "isNew": false,
    "categorySlug": "dishes",
    "categoryName": "Dishes",
    "quantity": 2
  },
  {
    "id": "353768da-94cf-4599-82ac-194d4972d93f",
    "title": "Large white t-shirt with big Altenar logo",
    "imageUrl": "https://www.dup-lex.fr/images/product-7.jpg",
    "description":
        "This white t-shirt features a vibrant logo on the front, adding a pop of color to your look. Made with high-quality cotton, it feels soft and comfortable against your skin. Perfect for casual occasions or just lounging around at home, this t-shirt is sure to become an essential in your wardrobe.",
    "price": 240,
    "status": 0,
    "isNew": true,
    "categorySlug": "clothes",
    "categoryName": "Clothes",
    "quantity": 1,
    "option": "L"
  },
  {
    "id": "8ab211a3-c72e-40e3-9024-c1a514a2af6f",
    "title": "Large blue cup with big Altenar logo",
    "imageUrl": "https://www.mbsopt.com/wp-content/uploads/2019/09/BLUE.png",
    "description":
        "The blue cup with logo is a durable ceramic mug that comes in a deep shade of blue. The logo is imprinted on the side of the cup, adding a touch of personalization to your morning coffee routine. Whether you're sipping hot cocoa or tea, this cup will keep your beverage warm and toasty for longer periods of time. It has a comfortable grip handle that fits easily in your hand and prevents slipping while drinking. This cup with logo is perfect for gifts, giveaways, or simply enjoying yourself!",
    "price": 240,
    "status": 0,
    "isNew": false,
    "categorySlug": "dishes",
    "categoryName": "Dishes",
    "quantity": 2
  },
];
