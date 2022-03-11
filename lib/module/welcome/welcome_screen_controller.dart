import 'dart:ui';

import 'package:fab_nhl/common/storage/local_storage.dart';
import 'package:fab_nhl/common/utilities/app_constants.dart';
import 'package:fab_nhl/route/route_paths.dart' as path;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller for welcome screen
/// Handles page swipe and (observable) current page state
/// Stores and updates (observable) titles based on current page
class WelcomeController extends GetxController {
  /// stores current language
  AppLanguage _language = AppLanguage.english;

  /// title for language switch button
  String languageTitle = arabic_label;

  /// observable current page index
  final currentPage = 0.obs;

  static final String title = welcomeScreenTitles.first;

  /// observable title for display
  final welcomeMessage = title.obs;

  /// navigation to login screen
  void navigateToLogin() async {
    var userInfo = await LocalStorage.getUserInfo();
    await LocalStorage.removeUserInfo();
    userInfo = await LocalStorage.getUserInfo();
    // if user info is stored we go to pin screen, if not to login screen
    if (userInfo != null) {
      Get.toNamed(path.loginPin);
    } else {
      Get.toNamed(path.login);
    }
  }

  /// navigation to register screen
  void navigateToRegister() {
    Get.toNamed(path.registerMobile);
  }

  /// language selection action
  void changeLanguage() {
    if (_language == AppLanguage.english) {
      Get.updateLocale(const Locale('ar'));
      languageTitle = english_label;
      _language = AppLanguage.arabic;
    } else {
      Get.updateLocale(const Locale('en_US'));
      languageTitle = arabic_label;
      _language = AppLanguage.english;
    }
  }

  /// setting current page on swipe
  void setPage(int pageNum) {
    currentPage(pageNum);
    welcomeMessage(welcomeScreenTitles[pageNum]);
  }
}
