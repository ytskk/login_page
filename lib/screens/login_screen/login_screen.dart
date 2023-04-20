import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import 'widgets/login_button_widget.dart';
import 'widgets/preview_button_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: authController.checkAuth(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return Center(
              child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (authController.isAuth.value)
                  PreviewButtonWidget(authController)
                else
                  LoginButtonWidget(authController)
              ],
            ),
          ));
        },
      ),
    );
  }
}
