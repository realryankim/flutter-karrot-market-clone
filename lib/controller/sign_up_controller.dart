import 'package:carrot_market_clone/utils/error_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get to => SignUpController();

  RxString userEmail = ''.obs;
  RxString userName = ''.obs;
  RxString userPassword = ''.obs;
  RxBool isLoading = false.obs;

  final auth = FirebaseAuth.instance;

  void setEmail(String email) {
    userEmail.value = email;
  }

  void setUserName(String name) {
    userName.value = name;
  }

  void setUserPassword(String password) {
    userPassword.value = password;
  }

  bool validateEmail(String value) {
    if (value.isEmpty || !value.contains('@')) {
      return false;
    } else {
      return true;
    }
  }

  bool validateUserName(String value) {
    if (value.isEmpty || value.length < 4) {
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
    final isValid = validateEmail(userEmail.value) &&
        validateUserName(userName.value) &&
        validatePassword(userPassword.value);

    Get.focusScope!.unfocus();

    if (!isValid) {
      ErrorSnackbar.errorSnackbar();
    }

    if (isValid) {
      submitSignUpForm(
        userEmail.value.trim(),
        userName.value.trim(),
        userPassword.value.trim(),
      );
    }
  }

  void submitSignUpForm(
    String email,
    String name,
    String password,
  ) async {
    try {
      final newUser = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (newUser.user != null) {
        // 회원가입 성공 => app 페이지로 이동
        Get.toNamed('/app');
        userEmail('');
        userName('');
        userPassword('');
      }
    } catch (error) {
      print(error);
      ErrorSnackbar.errorSnackbar();
    }
  }
}
