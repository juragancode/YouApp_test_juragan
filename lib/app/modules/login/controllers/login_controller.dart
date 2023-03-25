import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController usernameLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  FocusNode usernameLoginFN = FocusNode();
  FocusNode passwordLoginFN = FocusNode();

  RxBool obscureTextLogin = true.obs;

  RxBool isButtonLogin = true.obs;
  // RxBool isButtonRegister = true.obs;

  void checkButtonStatus() {
    if (usernameLogin.text.isNotEmpty && passwordLogin.text.isNotEmpty) {
      isButtonLogin.value = false;
    } else {
      isButtonLogin.value = true;
    }
  }
}
