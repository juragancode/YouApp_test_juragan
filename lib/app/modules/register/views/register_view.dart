import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_01_h_r/app/modules/register/controllers/register_controller.dart';
import 'package:test_01_h_r/utils/widgets/widgets.dart';
import 'package:test_01_h_r/app/routes/app_pages.dart';

final RegisterController controller = Get.put(RegisterController());

class RegisterView extends StatefulWidget {
  @override
  XRegisterViewState createState() => XRegisterViewState();
}

class XRegisterViewState extends State<RegisterView> {
  @override
  void initState() {
    super.initState();
    controller.usernameRegister.addListener(_updateButtonState);
    controller.passwordRegister.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      controller.checkButtonStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.usernameRegisterFN.unfocus();
        controller.emailRegisterFN.unfocus();
        controller.passwordRegisterFN.unfocus();
        controller.passwordConfirmRegisterFN.unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(
              CupertinoIcons.back,
            ),
          ),
          leadingWidth: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Back',
              style: TextStyle(),
            ),
          ),
        ),
        body: Container(
          decoration: Background(),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 41),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: 51,
                  margin: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: TextFormField(
                    focusNode: controller.emailRegisterFN,
                    controller: controller.emailRegister,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Create Email',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 16,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 51,
                  margin: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: TextFormField(
                    focusNode: controller.usernameRegisterFN,
                    controller: controller.usernameRegister,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Create Username',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 16,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 51,
                  margin: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: Obx(
                    () => TextFormField(
                      focusNode: controller.passwordRegisterFN,
                      controller: controller.passwordRegister,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      obscureText: controller.obscureTextPasswordRegister.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: GestureDetector(
                            onTap: () {
                              controller.obscureTextPasswordRegister.value =
                                  !controller.obscureTextPasswordRegister.value;
                            },
                            child: Icon(
                                controller.obscureTextPasswordRegister.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.white),
                          ),
                        ),
                        hintText: 'Create Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 51,
                  margin: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: Obx(
                    () => TextFormField(
                      focusNode: controller.passwordConfirmRegisterFN,
                      controller: controller.passwordConfirmRegister,
                      autocorrect: false,
                      obscureText:
                          controller.obscureTextPasswordConfirmRegister.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: GestureDetector(
                            onTap: () {
                              controller.obscureTextPasswordConfirmRegister
                                      .value =
                                  !controller
                                      .obscureTextPasswordConfirmRegister.value;
                            },
                            child: Icon(
                                controller.obscureTextPasswordConfirmRegister
                                        .value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.white),
                          ),
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                ButtonRegister(),
                SizedBox(height: 52),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.5,
                      ),
                    ),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.LOGIN),
                      child: Text(
                        "Login here",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.amber.shade200,
                          fontSize: 14.5,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
