import 'package:fab_nhl/common/style.dart';
import 'package:fab_nhl/locale/app_text.dart';
import 'package:fab_nhl/route/app_pages.dart';
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
      theme: FABStyles.appThemeData,
      getPages: AppPages.routes,
      initialRoute: AppPages.initialPath,
    ),
    designSize: const Size(375, 812),
  ));
}
