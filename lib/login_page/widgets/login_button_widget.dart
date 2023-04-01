import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../auth_controller.dart';
import 'log_result_snack_bar.dart';

class LoginButtonWidget extends StatelessWidget {
  final AuthController authController;
  const LoginButtonWidget(
    this.authController, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(380, 60),
            backgroundColor: const Color.fromRGBO(3, 134, 210, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: () async => {
              await authController.signIn(),
              ScaffoldMessenger.of(context).showSnackBar(
                LogResultSnackBar.showLogResultSnackBar(
                    authController.isAuth.value),
              )
            },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FaIcon(
              FontAwesomeIcons.google,
              size: 20,
            ),
            Text(
              ' Login with Google',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ));
  }
}