import 'package:carrot_market_clone/utils/error_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => LoginController();

  RxString userEmail = ''.obs;
  RxString userPassword = ''.obs;
  RxBool isLoading = false.obs;

  final auth = FirebaseAuth.instance;

  void setEmail(String email) {
    userEmail.value = email;
  }

  void setPassword(String password) {
    userPassword.value = password;
  }

  bool validateEmail(String value) {
    if (value.isEmpty || !value.contains('@')) {
      return false;
    } else {
      return true;
    }
  }

  bool validatePassword(String value) {
    if (value.isEmpty || value.length < 6) {
      return false;
    } else {
      return true;
    }
  }

  void trySubmit() {
    final isValid =
        validateEmail(userEmail.value) && validatePassword(userPassword.value);

    Get.focusScope!.unfocus();

    if (!isValid) {
      ErrorSnackbar.errorSnackbar();
    }

    if (isValid) {
      submitLoginForm(
        userEmail.value.trim(),
        userPassword.value.trim(),
      );
    }
  }

  void submitLoginForm(
    String email,
    String password,
  ) async {
    try {
      final newUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (newUser.user != null) {
        // 로그인 성공 => app 페이지로 이동
        Get.toNamed('/app');
      }
    } catch (error) {
      print(error);
      ErrorSnackbar.errorSnackbar();
    }
  }
}
