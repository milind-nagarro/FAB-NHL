import 'package:fab_nhl/module/register/RegisterMobileController.dart';
import 'package:fab_nhl/route/RoutePaths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends RegisterMobileController {
  final rememberMeFlag = false.obs;

  @override
  void nextScreen() {
    navigateToPinScreen();
  }

  void rememberMe(bool? flag) {
    rememberMeFlag(flag);
  }

  void toggleRememberMe() {
    rememberMe(!(rememberMeFlag.value));
  }

  void navigateToPinScreen() {
    debugPrint('navigatetoregister');
  }

  void navigateToRegisterScreen() {
    Get.toNamed(registerMobile);
  }
}
