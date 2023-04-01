import 'dart:developer';

import 'package:flutter/material.dart';

import '../auth_controller.dart';

class PreviewButtonWidget extends StatelessWidget {
  final AuthController authController;
  const PreviewButtonWidget(
    this.authController, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(left: 4),
            fixedSize: const Size(380, 60),
            backgroundColor: const Color.fromARGB(176, 64, 67, 75),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: () => log('go home'),
        onLongPress: () async => await authController.signOut(),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                authController.googleProfileInfo.value.photoUrl,
                width: 55,
                height: 55,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "  ${authController.googleProfileInfo.value.firstName} ${authController.googleProfileInfo.value.lastName}",
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ));
  }
}