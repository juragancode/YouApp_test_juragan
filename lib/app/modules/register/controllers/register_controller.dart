import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegisterController extends GetxController {
  FocusNode emailRegisterFN = FocusNode();
  FocusNode usernameRegisterFN = FocusNode();
  FocusNode passwordRegisterFN = FocusNode();
  FocusNode passwordConfirmRegisterFN = FocusNode();

  TextEditingController emailRegister = TextEditingController();
  TextEditingController usernameRegister = TextEditingController();
  TextEditingController passwordRegister = TextEditingController();
  TextEditingController passwordConfirmRegister = TextEditingController();

  RxBool obscureTextPasswordRegister = true.obs;
  RxBool obscureTextPasswordConfirmRegister = true.obs;

  RxBool isButtonRegister = true.obs;

  void checkButtonStatus() {
    if (

        ///
        emailRegister.text.isNotEmpty &&
            usernameRegister.text.isNotEmpty &&
            passwordRegister.text.isNotEmpty &&
            passwordConfirmRegister.text.isNotEmpty

        ///
        ) {
      isButtonRegister.value = false;
    } else {
      isButtonRegister.value = true;
    }
  }
}
