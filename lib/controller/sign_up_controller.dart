import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get to => SignUpController();

  final formKey = GlobalKey<FormState>();
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

    print("isValid: $isValid");
    if (!isValid) {
      Get.showSnackbar(
        GetBar(
          messageText: Text('입력이 잘못되었어요. 다시 한번 확인해주세요.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11.0,
              )),
          backgroundColor: Colors.black,
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(12.0),
          borderRadius: 5.0,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    if (isValid) {
      submitSignUpForm(
        userEmail.value.trim(),
        userName.value.trim(),
        userPassword.value.trim(),
      );
    }
  }

  submitSignUpForm(
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
        // 회원가입 성공 => app으로 페이지로 이동
        Get.toNamed('/app');
      }
    } catch (error) {
      print(error);
      Get.showSnackbar(
        GetBar(
          messageText: Text('입력이 잘못되었어요. 다시 한번 확인해주세요.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11.0,
              )),
          backgroundColor: Colors.black,
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(12.0),
          borderRadius: 5.0,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
