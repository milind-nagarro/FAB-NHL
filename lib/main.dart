import 'package:fab_nhl/locale/AppText.dart';
import 'package:fab_nhl/route/AppPages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(ScreenUtilInit(
    builder: () => GetMaterialApp(
      // home: Welcome(),
      debugShowCheckedModeBanner: false,
      translations: AppText(),
      locale: const Locale('en_US'),
      // translations will be displayed in that locale
      fallbackLocale: const Locale('en_US'),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    ),
    designSize: const Size(375, 812),
  ));
}
