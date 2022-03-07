import 'dart:ui';

import 'package:fab_nhl/route/RoutePaths.dart' as path;
import 'package:get/get.dart';
import 'package:fab_nhl/utilities/constants.dart';

class WelcomeController extends GetxController {
  String selectedLanguage = "ةيبرعلا";
  final currentPage = 0.obs;
  static final String title = titles.first;
  final welcomeMessage = title.obs;

  void navigateToLogin() {}

  void navigateToRegister() {
    Get.offNamed(path.registerMobile);
  }

  void changeLanguage() {
    if (selectedLanguage == "ةيبرعلا") {
      Get.updateLocale(const Locale('ar'));
      selectedLanguage = "English";
    } else {
      Get.updateLocale(const Locale('en_US'));
      selectedLanguage = "ةيبرعلا";
    }
  }

  void setPage(int pageNum) {
    currentPage(pageNum);
    welcomeMessage(titles[pageNum]);
  }
}
