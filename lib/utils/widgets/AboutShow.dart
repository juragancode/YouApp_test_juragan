import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/success/controllers/success_controller.dart';

final SuccessController controller = Get.find();

class AboutShow extends GetView<SuccessController> {
  const AboutShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 389,
      height: 578,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFF0E191F),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                controller.aboutIsHide.toggle();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15, top: 5),
                child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: [
                        Color.fromARGB(255, 208, 157, 56),
                        Color(0xFFF3EDA6),
                        Color(0xFFF8FAE5),
                        Color(0xFFFFE2BE),
                        Color.fromARGB(255, 234, 177, 45),
                        Color(0xFFF8FAE5),
                        Color(0xFFF8FAE5),
                        Color.fromARGB(255, 237, 174, 29),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: Text(
                    "Save & Update",
                    style: TextStyle(
                      fontSize: 14.2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 33, top: 19),
            child: Text(
              "About",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 30,
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Colors.grey.withOpacity(0.15),
              ),
              child: Center(
                child: Icon(
                  CupertinoIcons.add,
                  color: Colors.white60,
                  size: 34,
                ),
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 110,
            child: Text(
              "Add image",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: 164,
            left: 28,
            child: Container(
              width: 354,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Display name:",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontSize: 15.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 210,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        child: TextFormField(
                          // focusNode: controller.emailRegisterFN,
                          // controller: controller.emailRegister,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Enter name',
                            hintTextDirection: TextDirection.rtl,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 128, 130, 133)
                                    .withOpacity(0.5),
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 128, 130, 133)
                                  .withOpacity(0.5),
                              fontSize: 14.8,
                              fontWeight: FontWeight.w500,
                            ),
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
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gender:",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontSize: 15.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 210,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        child: TextFormField(
                          // focusNode: controller.emailRegisterFN,
                          // controller: controller.emailRegister,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Select Gender',
                            hintTextDirection: TextDirection.rtl,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 128, 130, 133)
                                    .withOpacity(0.5),
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 128, 130, 133)
                                  .withOpacity(0.5),
                              fontSize: 14.8,
                              fontWeight: FontWeight.w500,
                            ),
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
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Birthday:",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontSize: 15.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 210,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        child: TextFormField(
                          // focusNode: controller.emailRegisterFN,
                          // controller: controller.emailRegister,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'DD MM YYYY',
                            hintTextDirection: TextDirection.rtl,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 128, 130, 133)
                                    .withOpacity(0.5),
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 128, 130, 133)
                                  .withOpacity(0.5),
                              fontSize: 14.8,
                              fontWeight: FontWeight.w500,
                            ),
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
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Horoscope:",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontSize: 15.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 210,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        child: TextFormField(
                          // focusNode: controller.emailRegisterFN,
                          // controller: controller.emailRegister,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: '--',
                            hintTextDirection: TextDirection.rtl,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 128, 130, 133)
                                    .withOpacity(0.5),
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 128, 130, 133)
                                  .withOpacity(0.5),
                              fontSize: 14.8,
                              fontWeight: FontWeight.w500,
                            ),
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
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Zodiac:",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontSize: 15.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 210,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        child: TextFormField(
                          // focusNode: controller.emailRegisterFN,
                          // controller: controller.emailRegister,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: '--',
                            hintTextDirection: TextDirection.rtl,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 128, 130, 133)
                                    .withOpacity(0.5),
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 128, 130, 133)
                                  .withOpacity(0.5),
                              fontSize: 14.8,
                              fontWeight: FontWeight.w500,
                            ),
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
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Height:",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontSize: 15.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 210,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        child: TextFormField(
                          // focusNode: controller.emailRegisterFN,
                          // controller: controller.emailRegister,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Add height',
                            hintTextDirection: TextDirection.rtl,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 128, 130, 133)
                                    .withOpacity(0.5),
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 128, 130, 133)
                                  .withOpacity(0.5),
                              fontSize: 14.8,
                              fontWeight: FontWeight.w500,
                            ),
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
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Weight:",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontSize: 15.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 210,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        child: TextFormField(
                          // focusNode: controller.emailRegisterFN,
                          // controller: controller.emailRegister,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Add weight',
                            hintTextDirection: TextDirection.rtl,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 128, 130, 133)
                                    .withOpacity(0.5),
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 128, 130, 133)
                                  .withOpacity(0.5),
                              fontSize: 14.8,
                              fontWeight: FontWeight.w500,
                            ),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
