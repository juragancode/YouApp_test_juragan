import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_01_h_r/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  FocusNode emailLoginFN = FocusNode();
  FocusNode passwordLoginFN = FocusNode();

  RxBool obscureTextLogin = true.obs;
  RxBool loadingLogin = false.obs;
  RxBool isButtonLogin = true.obs;

  void checkButtonStatus() {
    if (emailLogin.text.isNotEmpty && passwordLogin.text.isNotEmpty) {
      isButtonLogin.value = false;
    } else {
      isButtonLogin.value = true;
    }
  }

  void loginButton() async {
    loadingLogin.value = true;
    try {
      var response = await http.get(
        Uri.parse(
            "http://techtest.youapp.ai/api/login?email=${emailLogin.text}&password=${passwordLogin.text}"),
        // body: {"email": emailLogin.text, "password": passwordLogin.text},
      );
      loadingLogin.value = false;
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
  }
}
