import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_01_h_r/app/routes/app_pages.dart';

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
  RxBool passwordSama = false.obs;
  RxBool loadingRegister = false.obs;

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

  void checkKesamaanPassword() {
    if (passwordRegister.text == passwordConfirmRegister.text) {
      passwordSama.value = true;
    } else {
      passwordSama.value = false;
    }
  }

  void registerButton() async {
    if (passwordRegister.text == passwordConfirmRegister.text) {
      try {
        loadingRegister.value = true;
        var response = await http.post(
          Uri.parse("http://techtest.youapp.ai/api/register"),
          body: {
            "name": usernameRegister.text,
            "email": emailRegister.text,
            "password": passwordConfirmRegister.text
          },
        );
        loadingRegister.value = false;
        Map<String, dynamic> logdata =
            jsonDecode(response.body) as Map<String, dynamic>;

        if (logdata['message'] == "success") {
          Get.offAllNamed(Routes.SUCCESS);
        } else if (logdata['message'] != "success") {
          Get.defaultDialog(
            title: "Terjadi kesalahan",
            middleText: "${logdata['message']}",
          );
        }
      } catch (e) {
        Get.defaultDialog(
          title: "Login gagal",
          middleText: "Periksa koneksi internet",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Password tidak sama",
        middleText: "Password harus sama",
      );
    }
  }
}
