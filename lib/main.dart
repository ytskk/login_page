import 'package:bonus_api/bonus_api.dart';
import 'package:bonus_repository/bonus_repository.dart';
import 'package:cache_client/cache_client.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/app.dart';
import 'package:training_and_testing/constants/generated/codegen_loader.g.dart';
import 'package:training_and_testing/controllers/controllers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', ''), Locale('ru', '')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: BonusesApp(),
    ),
  );
}

Future<void> setup() async {
  await EasyLocalization.ensureInitialized();
  await _initControllers();
}

Future<void> _initControllers() async {
  final authController = Get.put(AuthController());
  await authController.verifyingUserAuthorization();

  Get
    ..put(
      BonusApiClient(
        Dio(
          BaseOptions(
            // //  android base url
            // baseUrl: 'http://10.0.2.2:8081/',
            // // ios base url
            baseUrl: 'http://localhost:8081/',
            sendTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          ),
        ),
      ),
    )
    ..put<IBonusRepository>(
      NetworkCacheableBonusRepository(
        bonusApi: Get.find(),
        cacheClient: InMemoryCacheClient(),
      ),
    )

    // user controller
    ..put(
      UserController(
        bonusRepository: Get.find(),
      ),
    );
}
