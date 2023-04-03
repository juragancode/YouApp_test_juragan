import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_01_h_r/utils/widgets/BlueText_Save.dart';
import 'package:test_01_h_r/utils/widgets/GoldText_2%20copy.dart';

import '../../../../utils/widgets/widgets.dart';
import '../controllers/interest_controller.dart';

final InterestController controller = Get.find();

class InterestView extends StatefulWidget {
  @override
  State<InterestView> createState() => _InterestViewState();
}

class _InterestViewState extends State<InterestView> {
  void addInterest(String interest) {
    setState(() {
      controller.interests.add(interest);
      controller.interestC.clear();
    });
  }

  void removeInterest(String interest) {
    setState(() {
      controller.interests.remove(interest);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.interestFN.unfocus();
      },
      child: Scaffold(
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
              icon: Icon(CupertinoIcons.back),
            ),
          ),
          title: Text(
            'Back',
            style: TextStyle(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: BlueText_Save(),
              ),
            ),
          ],
        ),
        body: Container(
          decoration: Background(),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: GoldText_2(),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "What interest you?",
                      style: TextStyle(
                        fontSize: 24.2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35),
                GestureDetector(
                  onTap: () {
                    controller.interestFN.requestFocus();
                  },
                  child: Container(
                    // height: 51,
                    margin: EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                            left: 15,
                            right: 15,
                          ),
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: controller.interests
                                .map(
                                  (interest) => InputChip(
                                    backgroundColor:
                                        Color.fromARGB(255, 137, 232, 243)
                                            .withOpacity(0.2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        8, // ganti dengan radius yang Anda inginkan
                                      ),
                                    ),
                                    label: Text(
                                      interest,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onDeleted: () => removeInterest(interest),
                                    deleteIcon: Icon(
                                      Icons.close,
                                      size: 18,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        TextField(
                          focusNode: controller.interestFN,
                          autocorrect: false,
                          controller: controller.interestC,
                          onSubmitted: (value) {
                            if (value.isNotEmpty) {
                              addInterest(
                                value.trim(),
                              );
                            }
                          },
                          decoration: InputDecoration(
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
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
