import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/success/controllers/success_controller.dart';

final SuccessController controller = Get.find();

class AboutHide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 389,
          height: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xFF162329),
            image: controller.image != null
                ? DecorationImage(
                    image: FileImage(
                      controller.image!,
                    ),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: Stack(
            children: [
              Positioned(
                left: 18,
                bottom: controller.bottomUsername,
                child: Text(
                  "@johndoe, ${controller.ageX}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                left: 21,
                bottom: 70,
                child: Text(
                  controller.genderC.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 18,
                bottom: 20,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: controller.image != null
                            ? controller.birthdayC.text.isNotEmpty
                                ? Colors.grey.shade900.withOpacity(0.7)
                                : null
                            : null,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                            16,
                            5,
                            16,
                            5,
                          ),
                          child: Flexible(
                            child: Row(
                              children: [
                                controller.birthdayC.text.isNotEmpty
                                    ? Container(
                                        width: 21,
                                        height: 21,
                                        child: ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                            Colors.white,
                                            BlendMode.srcIn,
                                          ),
                                          child: Image(
                                            image: controller.getHoroscopeImage(
                                                controller.horoscopeC.text),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                SizedBox(width: 10),
                                Text(
                                  controller.horoscopeC.text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: controller.image != null
                            ? controller.birthdayC.text.isNotEmpty
                                ? Colors.grey.shade900.withOpacity(0.7)
                                : null
                            : null,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                            16,
                            5,
                            16,
                            5,
                          ),
                          child: Flexible(
                            child: Row(
                              children: [
                                controller.birthdayC.text.isNotEmpty
                                    ? Container(
                                        width: 24,
                                        height: 24,
                                        child: ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                            Colors.white,
                                            BlendMode.srcIn,
                                          ),
                                          child: Image(
                                            image: controller.getChineseZodiac(
                                                controller.zodiacC.text),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                SizedBox(width: 10),
                                Text(
                                  controller.zodiacC.text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        Container(
          width: 389,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xFF0E191F),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    controller.aboutIsHide.toggle();
                  },
                  icon: Icon(
                    Icons.border_color_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 33, top: 15),
                child: Text(
                  "About",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, top: 15),
                    child: controller.birthdayC.text.isNotEmpty &&
                            controller.aboutDataTerisi.isTrue
                        ? Row(
                            children: [
                              Text(
                                "Birthday:",
                                style: TextStyle(
                                  color: Colors.grey.withOpacity(0.5),
                                  fontSize: 15.4,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 7),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  "${controller.birthday2C.text} (Age ${controller.ageX})",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.4,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, top: 15),
                    child: controller.birthdayC.text.isNotEmpty &&
                            controller.aboutDataTerisi.isTrue
                        ? Row(
                            children: [
                              Text(
                                "Horoscope:",
                                style: TextStyle(
                                  color: Colors.grey.withOpacity(0.5),
                                  fontSize: 15.4,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 7),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  controller.horoscopeC.text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.4,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, top: 15),
                    child: controller.birthdayC.text.isNotEmpty &&
                            controller.aboutDataTerisi.isTrue
                        ? Row(
                            children: [
                              Text(
                                "Zodiac:",
                                style: TextStyle(
                                  color: Colors.grey.withOpacity(0.5),
                                  fontSize: 15.4,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 7),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  controller.zodiacC.text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.4,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, top: 15),
                    child: controller.heightC.text.isNotEmpty &&
                            controller.aboutDataTerisi.isTrue
                        ? Row(
                            children: [
                              Text(
                                "Height:",
                                style: TextStyle(
                                  color: Colors.grey.withOpacity(0.5),
                                  fontSize: 15.4,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 7),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  controller.heightC.text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.4,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, top: 19),
                    child: controller.weightC.text.isNotEmpty &&
                            controller.aboutDataTerisi.isTrue
                        ? Row(
                            children: [
                              Text(
                                "Weight:",
                                style: TextStyle(
                                  color: Colors.grey.withOpacity(0.5),
                                  fontSize: 15.4,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 7),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  controller.weightC.text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.4,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : null,
                  ),
                  SizedBox(height: 25)
                ],
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(left: 33, top: 82, bottom: 40),
                  child: controller.aboutDataTerisi.isFalse
                      ? Text(
                          "Add in your your to help others know you better",
                          style: TextStyle(
                            color: Color.fromARGB(255, 163, 163, 163),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
