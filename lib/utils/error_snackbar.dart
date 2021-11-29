import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorSnackbar {
  static void errorSnackbar() {
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
}
