import 'package:fab_nhl/module/register/RegisterMobileController.dart';
import 'package:fab_nhl/route/RoutePaths.dart';
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

  void navigateToPinScreen() {}

  void navigateToRegisterScreen() {
    Get.toNamed(registerMobile);
  }
}
