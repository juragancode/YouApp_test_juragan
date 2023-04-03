import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InterestController extends GetxController {
  TextEditingController interestC = TextEditingController();

  FocusNode interestFN = FocusNode();

  final RxList<dynamic> interests = [].obs;
}
