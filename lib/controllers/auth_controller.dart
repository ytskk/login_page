import 'dart:developer';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/google_user_model.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final RxBool isAuth = false.obs;
  late Rx<GoogleUserModel> googleProfileInfo;

  Future<void> checkAuth() async {
    final GoogleSignInAccount? googleUser =
        await _googleSignIn.signInSilently();
    if (googleUser != null) {
      _setGoogleProfileInfo(googleUser);
    }
  }

  Future<void> signIn() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        _setGoogleProfileInfo(googleUser);
      }
    } catch (err) {
      log(err.toString());
    }
  }

  void _setGoogleProfileInfo(googleUser) {
    List<String> displayName = googleUser.displayName?.split(' ') ?? [];
    googleProfileInfo = GoogleUserModel(
            firstName: (displayName.isNotEmpty) ? displayName[0] : '',
            lastName: (displayName.length > 1) ? displayName[1] : '',
            email: googleUser.email,
            photoUrl: googleUser.photoUrl ??
                'https://pixelbox.ru/wp-content/uploads/2021/04/cats-ava-steam-18.jpg')
        .obs;
    isAuth.value = true;
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    isAuth.value = false;
  }
}
