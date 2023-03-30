import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SuccessController extends GetxController {
  RxBool aboutIsHide = true.obs;

  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final birthdayController = TextEditingController();
  final horoscopeController = TextEditingController();
  final zodiacController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
}
