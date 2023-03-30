import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_01_h_r/utils/widgets/AboutShow.dart';
import 'package:test_01_h_r/utils/widgets/widgets.dart';

import '../controllers/success_controller.dart';

final SuccessController controller = Get.find();

class SuccessView extends GetView<SuccessController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 90.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              print("Back button pressed");
              Get.back();
            },
            icon: Icon(
              CupertinoIcons.back,
            ),
          ),
        ),
        title: Text(
          'Back',
          style: TextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: Background2(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 74),
                Text(
                  "@johndoe123",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 28),
                Container(
                  width: 389,
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFF162329),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18, bottom: 19),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "@johndoe123",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Obx(() =>
                    controller.aboutIsHide.isTrue ? AboutHide() : AboutShow()),
                SizedBox(height: 24),
                Obx(() => controller.aboutIsHide.isTrue
                    ? InterestHide()
                    : InterestHide()),
                SizedBox(height: 250),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container InterestHide() {
    return Container(
      width: 389,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFF0E191F),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
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
          Padding(
            padding: const EdgeInsets.only(left: 33, top: 82),
            child: Text(
              "Add in your interest to find a better match",
              style: TextStyle(
                color: Color.fromARGB(255, 163, 163, 163),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutHide extends StatelessWidget {
  const AboutHide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 389,
      height: 160,
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
          Padding(
            padding: const EdgeInsets.only(left: 33, top: 82),
            child: Text(
              "Add in your your to help others know you better",
              style: TextStyle(
                color: Color.fromARGB(255, 163, 163, 163),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
