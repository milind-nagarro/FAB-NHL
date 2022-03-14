import 'package:fab_nhl/common/style.dart';
import 'package:fab_nhl/locale/app_text.dart';
import 'package:fab_nhl/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'module/welcome/cubit/welcome_cubit.dart';

void main() {
  runApp(ScreenUtilInit(
    builder: () => BlocProvider(
      create: (_) => WelcomeCubit(),
      child: GetMaterialApp(
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
    ),
    designSize: const Size(375, 812),
  ));
}
