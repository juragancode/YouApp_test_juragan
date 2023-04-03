import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessController extends GetxController {
  RxBool aboutIsHide = true.obs;

  final nameC = TextEditingController();
  final genderC = TextEditingController();
  final birthdayC = TextEditingController();
  final birthday2C = TextEditingController();
  final horoscopeC = TextEditingController();
  final zodiacC = TextEditingController();
  final heightC = TextEditingController();
  final weightC = TextEditingController();

  FocusNode nameFN = FocusNode();
  FocusNode genderFN = FocusNode();
  FocusNode birthdayFN = FocusNode();
  FocusNode horoscopeFN = FocusNode();
  FocusNode zodiacFN = FocusNode();
  FocusNode heightFN = FocusNode();
  FocusNode weightFN = FocusNode();

  String suffixTextHeight = "";
  String suffixTextweight = "";
  double bottomUsername = 19;
  String ageX = "";

  File? image;

  /// horoscope
  String calculateHoroscope(DateTime date) {
    if ((date.month == 3 && date.day >= 21) ||
        (date.month == 4 && date.day <= 19)) {
      return 'Aries';
    } else if ((date.month == 4 && date.day >= 20) ||
        (date.month == 5 && date.day <= 20)) {
      return 'Taurus';
    } else if ((date.month == 5 && date.day >= 21) ||
        (date.month == 6 && date.day <= 20)) {
      return 'Gemini';
    } else if ((date.month == 6 && date.day >= 21) ||
        (date.month == 7 && date.day <= 22)) {
      return 'Cancer';
    } else if ((date.month == 7 && date.day >= 23) ||
        (date.month == 8 && date.day <= 22)) {
      return 'Leo';
    } else if ((date.month == 8 && date.day >= 23) ||
        (date.month == 9 && date.day <= 22)) {
      return 'Virgo';
    } else if ((date.month == 9 && date.day >= 23) ||
        (date.month == 10 && date.day <= 22)) {
      return 'Libra';
    } else if ((date.month == 10 && date.day >= 23) ||
        (date.month == 11 && date.day <= 21)) {
      return 'Scorpio';
    } else if ((date.month == 11 && date.day >= 22) ||
        (date.month == 12 && date.day <= 21)) {
      return 'Sagittarius';
    } else if ((date.month == 12 && date.day >= 22) ||
        (date.month == 1 && date.day <= 19)) {
      return 'Capricorn';
    } else if ((date.month == 1 && date.day >= 20) ||
        (date.month == 2 && date.day <= 18)) {
      return 'Aquarius';
    } else {
      return 'Pisces';
    }
  }

  ImageProvider getHoroscopeImage(String horoscopeC) {
    switch (horoscopeC) {
      case 'Aries':
        return AssetImage('assets/horoscope/aries.png');
      case 'Taurus':
        return AssetImage('assets/horoscope/taurus.png');
      case 'Gemini':
        return AssetImage('assets/horoscope/gemini.png');
      case 'Cancer':
        return AssetImage('assets/horoscope/cancer.png');
      case 'Leo':
        return AssetImage('assets/horoscope/leo.png');
      case 'Virgo':
        return AssetImage('assets/horoscope/virgo.png');
      case 'Libra':
        return AssetImage('assets/horoscope/libra.png');
      case 'Scorpio':
        return AssetImage('assets/horoscope/scorpio.png');
      case 'Sagittarius':
        return AssetImage('assets/horoscope/sagittarius.png');
      case 'Capricorn':
        return AssetImage('assets/horoscope/capricorn.png');
      case 'Aquarius':
        return AssetImage('assets/horoscope/aquarius.png');
      case 'Pisces':
        return AssetImage('assets/horoscope/pisces.png');
      default:
        return AssetImage('assets/horoscope/pisces.png');
    }
  }

  /// zodiac
  String calculateChineseZodiac(DateTime date) {
    const chineseZodiacSigns = {
      0: 'Monkey',
      1: 'Rooster',
      2: 'Dog',
      3: 'Pig',
      4: 'Rat',
      5: 'Ox',
      6: 'Tiger',
      7: 'Rabbit',
      8: 'Dragon',
      9: 'Snake',
      10: 'Horse',
      11: 'Goat'
    };

    int year = date.year;
    // int chineseZodiacIndex = (year - 4) % 12;
    int chineseZodiacIndex = year % 12;
    return chineseZodiacSigns[chineseZodiacIndex]!;
  }

  /// zodiac icon
  ImageProvider getChineseZodiac(String zodiacC) {
    switch (zodiacC) {
      case 'Rat':
        return AssetImage('assets/zodiac/rat.png');
      case 'Ox':
        return AssetImage('assets/zodiac/ox.png');
      case 'Tiger':
        return AssetImage('assets/zodiac/tiger.png');
      case 'Rabbit':
        return AssetImage('assets/zodiac/rabbit.png');
      case 'Dragon':
        return AssetImage('assets/zodiac/dragon.png');
      case 'Snake':
        return AssetImage('assets/zodiac/snake.png');
      case 'Horse':
        return AssetImage('assets/zodiac/horse.png');
      case 'Goat':
        return AssetImage('assets/zodiac/goat.png');
      case 'Monkey':
        return AssetImage('assets/zodiac/monkey.png');
      case 'Rooster':
        return AssetImage('assets/zodiac/rooster.png');
      case 'Dog':
        return AssetImage('assets/zodiac/dog.png');
      case 'Pig':
        return AssetImage('assets/zodiac/pig.png');
      default:
        return AssetImage('assets/zodiac/pig.png');
    }
  }

  /// age
  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  ///
  RxBool aboutDataTerisi = false.obs;

  void checkDataAbout() {
    if (

        ///
        genderC.text.isNotEmpty ||
            birthdayC.text.isNotEmpty ||
            heightC.text.isNotEmpty ||
            weightC.text.isNotEmpty

        ///
        ) {
      aboutDataTerisi.value = true;
    } else {
      aboutDataTerisi.value = true;
    }
  }
}
