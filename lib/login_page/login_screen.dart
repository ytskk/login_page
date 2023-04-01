import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';
import 'widgets/login_button_widget.dart';
import 'widgets/preview_button_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
    );
  }
}

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final AuthController authController = Get.put(AuthController());

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
            child: Obx(()=> Column(
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
