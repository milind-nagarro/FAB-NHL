import 'package:fab_nhl/module/register/register_mobile_controller.dart';
import 'package:fab_nhl/route/RoutePaths.dart';
import 'package:get/get.dart';

class LoginScreenController extends RegisterMobileController {
  final rememberMeFlag = false.obs;

  var pin = "".obs;

  void onPinTextChanged(String value) {
    pin(value);
  }

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
    Get.toNamed(loginPin);
  }

  void navigateToRegisterScreen() {
    Get.toNamed(registerMobile);
  }
}
