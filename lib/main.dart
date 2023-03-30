import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'utils/themeYouApp.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeYouApp(),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}

