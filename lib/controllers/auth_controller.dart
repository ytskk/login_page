import 'dart:developer';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/google_user_model.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Rx<bool> isLoggedIn = Rx<bool>(false);
  Rx<bool> startedAuth = Rx<bool>(false);
  Rx<GoogleUserModel?> googleProfileInfo = null.obs;
  

  Future<void> verifyingUserAuthorization() async {
    try {
      final GoogleSignInAccount? googleUser =
          await _googleSignIn.signInSilently();
      if (googleUser != null) {
        _setGoogleProfileInfo(googleUser);
      }
    } catch (err) {
      log(err.toString());
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
    isLoggedIn.value = true;
    update();
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      isLoggedIn.value = false;
      update();
    } catch (err) {
      log(err.toString());
    }
  }
}

