import 'dart:ui';

import 'package:fab_nhl/route/RoutePaths.dart' as path;
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  String selectedLanguage = "Arabic";

  void navigateToLogin() {}

  void navigateToRegister() {
    Get.offNamed(path.registerMobile);
  }

  void changeLanguage() {
    if (selectedLanguage == "Arabic") {
      Get.updateLocale(const Locale('ar'));
      selectedLanguage = "English";
    } else {
      Get.updateLocale(const Locale('en_US'));
      selectedLanguage = "Arabic";
    }
  }
}
