import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/widgets/AboutHide.dart';
import '../../../../utils/widgets/AboutShow.dart';
import '../../../../utils/widgets/widgets.dart';
import '../../../routes/app_pages.dart';
import '../../Interest/controllers/interest_controller.dart';
import '../controllers/success_controller.dart';

final SuccessController controller = Get.find();
final InterestController interestC = Get.find();

class SuccessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(InterestController());

    return GestureDetector(
      onTap: () {
        controller.nameFN.unfocus();
        controller.genderFN.unfocus();
        controller.birthdayFN.unfocus();
        controller.horoscopeFN.unfocus();
        controller.zodiacFN.unfocus();
        controller.heightFN.unfocus();
        controller.weightFN.unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   toolbarHeight: 90.0,
        //   leading: Padding(
        //     padding: const EdgeInsets.only(left: 20),
        //     child: IconButton(
        //       onPressed: () {
        //         print("Back button pressed");
        //         Get.back();
        //       },
        //       icon: Icon(
        //         CupertinoIcons.back,
        //       ),
        //     ),
        //   ),
        //   title: Text(
        //     'Back',
        //     style: TextStyle(
        //         ),
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Container(
            decoration: Background2(),
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                    top: 60,
                    left: 3,
                    child: IconButton(
                      onPressed: () {
                        controller.aboutIsHide.isFalse
                            ? controller.aboutIsHide.toggle()
                            : null;
                      },
                      icon: Icon(
                        CupertinoIcons.back,
                        size: 30,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 50,
                    child: TextButton(
                      onPressed: () {
                        controller.aboutIsHide.isFalse
                            ? controller.aboutIsHide.toggle()
                            : null;
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 74),
                      Text(
                        "@johndoe",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 28),
                      Obx(() => controller.aboutIsHide.isTrue
                          ? AboutHide()
                          : AboutShow()),
                      SizedBox(height: 24),
                      InterestHide(),
                      SizedBox(height: Get.height / 4),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container InterestHide() {
    return Container(
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
                Get.toNamed(Routes.INTEREST);
              },
              icon: Icon(
                Icons.border_color_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 33, top: 19),
            child: Text(
              "Interest",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(left: 33, top: 82, bottom: 40),
              child: interestC.interests.isEmpty
                  ? Text(
                      "Add in your interest to find a better match",
                      style: TextStyle(
                        color: Color.fromARGB(255, 163, 163, 163),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : null,
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(
                left: 27,
                right: 27,
                top: 60,
                bottom: 27,
              ),
              child: Wrap(
                spacing: 12.0, // jarak antar chip horizontal
                runSpacing: 3.0, // jarak antar chip vertical
                children: interestC.interests
                    .map(
                      (interest) => Chip(
                        backgroundColor: Color.fromRGBO(25, 37, 45, 1),
                        label: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            interest,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          // SizedBox(height: 30),
        ],
      ),
    );
  }
}
