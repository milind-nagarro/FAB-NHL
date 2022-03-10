import 'dart:ui';

import 'package:fab_nhl/route/RoutePaths.dart' as path;
import 'package:get/get.dart';
import 'package:fab_nhl/common/utilities/app_constants.dart';

class WelcomeController extends GetxController {
  AppLanguage _language = AppLanguage.english;
  String selectedLanguage = "ةيبرعلا";
  final currentPage = 0.obs;
  static final String title = welcomeScreenTitles.first;
  final welcomeMessage = title.obs;

  void navigateToLogin() {
    Get.toNamed(path.login);
  }

  void navigateToRegister() {
    Get.toNamed(path.registerMobile);
  }

  void changeLanguage() {
    if (_language == AppLanguage.english) {
      Get.updateLocale(const Locale('ar'));
      selectedLanguage = "English";
      _language = AppLanguage.arabic;
    } else {
      Get.updateLocale(const Locale('en_US'));
      selectedLanguage = "ةيبرعلا";
      _language = AppLanguage.english;
    }
  }

  void setPage(int pageNum) {
    currentPage(pageNum);
    welcomeMessage(welcomeScreenTitles[pageNum]);
  }
}
