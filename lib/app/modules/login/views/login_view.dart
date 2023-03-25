import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_01_h_r/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

final LoginController controller = Get.put(LoginController());

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    controller.usernameLogin.addListener(_updateButtonState);
    controller.passwordLogin.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      controller.checkButtonStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(CupertinoIcons.back),
        title: Text(
          'Back',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topRight,
            radius: 1.5173,
            colors: [
              Color.fromARGB(255, 35, 99, 108),
              Color.fromARGB(255, 25, 52, 61),
              Color(0xFF09141A),
            ],
            stops: [0, 0.5618, 1],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 25, left: 41),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 51,
                margin: EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: TextFormField(
                  controller: controller.usernameLogin,
                  decoration: InputDecoration(
                    hintText: 'Enter Username/Email',
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
                    controller: controller.passwordLogin,
                    obscureText: controller.obscureTextLogin.value,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () {
                            controller.obscureTextLogin.value =
                                !controller.obscureTextLogin.value;
                          },
                          child: Icon(
                              controller.obscureTextLogin.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.white),
                        ),
                      ),
                      hintText: 'Enter Password',
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
                    onChanged: (value) {
                      controller.usernameLogin.addListener(_updateButtonState);
                      // controller.passwordLogin.text;
                      controller.checkButtonStatus();
                    },
                  ),
                ),
              ),
              SizedBox(height: 25),
              Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: controller.isButtonLogin.isTrue
                          ? [
                              Color(0xFF62CDCB),
                              Color(0xFF4599DB),
                            ].map((color) {
                              final darkerColor = Color.fromRGBO(
                                (color.red * 0.7).round(),
                                (color.green * 0.7).round(),
                                (color.blue * 0.7).round(),
                                1,
                              );
                              return darkerColor;
                            }).toList()
                          : [
                              Color.fromARGB(255, 99, 234, 232),
                              Color(0xFF62CDCB),
                              Color.fromARGB(255, 70, 170, 247),
                              Color(0xFF4599DB),
                            ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        minimumSize: Size(Get.width - 44, 48)),
                    onPressed: controller.isButtonLogin.isTrue ? null : () {},
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: controller.isButtonLogin.isTrue
                            ? Colors.grey
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 52),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.5,
                    ),
                  ),
                  SizedBox(width: 5),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.REGISTER),
                    child: Text(
                      "Register here",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.amber.shade200,
                        fontSize: 14.5,
                      ),
                    ),
                  )
                ],
              ),
              // Center(
              //   child: Text.rich(
              //     TextSpan(
              //       children: <TextSpan>[
              //         TextSpan(
              //           text: "No account? ",
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 14.5,
              //           ),
              //         ),
              //         TextSpan(
              //           text: "Register here",
              //           style: TextStyle(
              //             decoration: TextDecoration.underline,
              //             color: Colors.amberAccent,
              //             fontSize: 14.5,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
