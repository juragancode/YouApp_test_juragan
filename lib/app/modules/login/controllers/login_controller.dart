import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController usernameLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  RxBool obscureTextLogin = true.obs;

  RxBool isButtonLogin = true.obs;

  void checkButtonStatus() {
    if (usernameLogin.text.isNotEmpty && passwordLogin.text.isNotEmpty) {
      isButtonLogin.value = false;
    } else {
      isButtonLogin.value = true;
    }
  }
}
