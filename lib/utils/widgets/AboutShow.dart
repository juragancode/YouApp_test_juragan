import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as intl;
import 'package:test_01_h_r/utils/widgets/GoldText_SaveUpdate.dart';

import '../../app/modules/success/controllers/success_controller.dart';

final SuccessController controller = Get.find();

class AboutShow extends StatefulWidget {
  const AboutShow({
    Key? key,
  }) : super(key: key);

  @override
  State<AboutShow> createState() => _AboutShowState();
}

class _AboutShowState extends State<AboutShow> {
  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? imagePick =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (imagePick != null) {
        controller.image = File(imagePick.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controller.heightC.addListener(editHeight);
    controller.weightC.addListener(editWeight);
    controller.genderC.addListener(bottomUsername);
    controller.birthdayC.addListener(bottomUsername);
  }

  void editWeight() {
    setState(() {
      controller.suffixTextweight =
          controller.weightC.text.isEmpty ? '' : ' kg';
    });
  }

  void editHeight() {
    setState(() {
      controller.suffixTextHeight =
          controller.heightC.text.isEmpty ? '' : ' cm';
    });
  }

  void bottomUsername() {
    setState(() {
      controller.bottomUsername = controller.genderC.text.isNotEmpty ||
              controller.birthdayC.text.isNotEmpty
          ? 100
          : 19;
    });
  }

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
                    child: GoldText_SaveUpdate(),
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
                child: GestureDetector(
                  onTap: () async {
                    await getImage();
                  },
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.grey.withOpacity(0.15),
                      image: controller.image != null
                          ? DecorationImage(
                              image: FileImage(
                                controller.image!,
                              ),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () async {
                          await getImage();
                        },
                        icon: Icon(
                          controller.image != null ? null : CupertinoIcons.add,
                          color: Colors.white60,
                          size: 34,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 76,
                left: 100,
                child: TextButton(
                  onPressed: () async {
                    await getImage();
                  },
                  child: Text(
                    "Add image",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
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
                              focusNode: controller.nameFN,
                              controller: controller.nameC,
                              autocorrect: false,
                              textDirection: TextDirection.rtl,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
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
                              focusNode: controller.genderFN,
                              controller: controller.genderC,
                              autocorrect: false,
                              textDirection: TextDirection.rtl,
                              textInputAction: TextInputAction.next,
                              readOnly: true,
                              onTap: () {
                                controller.nameFN.unfocus();
                                controller.genderFN.unfocus();
                                controller.birthdayFN.unfocus();
                                controller.horoscopeFN.unfocus();
                                controller.zodiacFN.unfocus();
                                controller.heightFN.unfocus();
                                controller.weightFN.unfocus();
                                // Tampilkan dropdown untuk memilih jenis kelamin
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SimpleDialog(
                                      title: Text('Select Gender'),
                                      children: [
                                        SimpleDialogOption(
                                          onPressed: () {
                                            controller.genderC.text = 'Male';
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Male',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        SimpleDialogOption(
                                          onPressed: () {
                                            controller.genderC.text = 'Female';
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Female',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: 'Select Gender',
                                suffixIcon: Icon(
                                  CupertinoIcons.chevron_down,
                                  color: Colors.grey.shade100,
                                  size: 19,
                                ),
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
                                contentPadding: EdgeInsets.only(
                                  left: 18,
                                  bottom: 16,
                                  top: 16,
                                  right: -7,
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
                              focusNode: controller.birthdayFN,
                              controller: controller.birthdayC,
                              autocorrect: false,
                              textDirection: TextDirection.rtl,
                              // textInputAction: TextInputAction.next,
                              onTap: () async {
                                controller.nameFN.unfocus();
                                controller.genderFN.unfocus();
                                controller.birthdayFN.unfocus();
                                controller.horoscopeFN.unfocus();
                                controller.zodiacFN.unfocus();
                                controller.heightFN.unfocus();
                                controller.weightFN.unfocus();
                                DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate:
                                      controller.birthdayC.text.isNotEmpty
                                          ? intl.DateFormat('yyyy MM dd')
                                              .parse(controller.birthdayC.text)
                                          : DateTime(2000),
                                  firstDate: DateTime(1933),
                                  lastDate: DateTime.now(),
                                );
                                if (date != null) {
                                  controller.horoscopeC.text =
                                      controller.calculateHoroscope(date);
                                  String chineseZodiac =
                                      controller.calculateChineseZodiac(date);
                                  controller.birthdayC.text =
                                      intl.DateFormat('yyyy MM dd')
                                          .format(date);
                                  controller.birthday2C.text =
                                      intl.DateFormat('dd/MM/yyyy')
                                          .format(date);
                                  controller.zodiacC.text = chineseZodiac;
                                  setState(() {
                                    controller.ageX = controller
                                        .calculateAge(date)
                                        .toString();
                                    controller.checkDataAbout();
                                  });
                                }
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
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
                              // enabled: false,
                              focusNode: controller.horoscopeFN,
                              controller: controller.horoscopeC,
                              autocorrect: false,
                              textDirection: TextDirection.rtl,
                              readOnly: true,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    strokeAlign: StrokeAlign.outside,
                                    width: 1,
                                    color: Color.fromARGB(255, 128, 130, 133)
                                        .withOpacity(0.5),
                                  ),
                                ),
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
                                color: Colors.grey,
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
                              focusNode: controller.zodiacFN,
                              controller: controller.zodiacC,
                              autocorrect: false,
                              textDirection: TextDirection.rtl,
                              readOnly: true,
                              // enabled: false,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    strokeAlign: StrokeAlign.outside,
                                    width: 1,
                                    color: Color.fromARGB(255, 128, 130, 133)
                                        .withOpacity(0.5),
                                  ),
                                ),
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
                                color: Colors.grey,
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
                              focusNode: controller.heightFN,
                              controller: controller.heightC,
                              autocorrect: false,
                              keyboardType: TextInputType.number,
                              textDirection: TextDirection.rtl,
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                setState(() {
                                  editHeight();
                                  controller.checkDataAbout();
                                });
                              },
                              decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: 'Add height',
                                suffixText: controller.suffixTextHeight,
                                suffixStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
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
                              focusNode: controller.weightFN,
                              controller: controller.weightC,
                              autocorrect: false,
                              textDirection: TextDirection.rtl,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  editWeight();
                                  controller.checkDataAbout();
                                });
                              },
                              decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: 'Add weight',
                                suffixText: controller.suffixTextweight,
                                suffixStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
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
        ),
      ],
    );
  }
}
