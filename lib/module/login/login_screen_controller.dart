import 'package:fab_nhl/module/register/register_mobile_controller.dart';
import 'package:fab_nhl/route/route_paths.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../common/utilities/app_constants.dart';

/// Controller for login screen. also helps login pin screen for pin value
/// Subclassed from RegisterMobileController both handle mobile number validation
class LoginScreenController extends RegisterMobileController {
  /// flag to handle remember me check box state
  final rememberMeFlag = false.obs;

  /// to store pin value on pin screen
  var pin = "".obs;

  /// update pin on text change
  void onPinTextChanged(String value) {
    pin(value);
  }

  /// overriding next screen logic from registercontroller
  @override
  void nextScreen() {
    navigateToPinScreen();
  }

  /// state change for remember me flag
  void rememberMe(bool? flag) {
    rememberMeFlag(flag);
  }

  /// toggle remember me when remember me text is tapped on screen
  void toggleRememberMe() {
    rememberMe(!(rememberMeFlag.value));
  }

  /// navigation to enter pin screen after number is validated
  void navigateToPinScreen() {
    Get.toNamed(loginPin);
  }

  /// navigation to register screen on tap of not yet registered button
  void navigateToRegisterScreen() {
    Get.toNamed(registerMobile);
  }

  @override
  Function()? nextStep(ValidationState vState) {
    if (isValueBlank.value) {
      return null;
    }
    switch (vState) {
      case ValidationState.invalid:
        return null;
      case ValidationState.valid:
        return () {
          FocusManager.instance.primaryFocus?.unfocus();
          nextScreen();
        };
      case ValidationState.notChecked:
        return () {
          FocusManager.instance.primaryFocus?.unfocus();
          validatePhone();
        };
    }
  }
}
