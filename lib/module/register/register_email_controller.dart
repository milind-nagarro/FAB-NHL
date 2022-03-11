import 'package:fab_nhl/route/route_paths.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../common/utilities/app_constants.dart';
import 'register_controller.dart';

class RegisterEmailController extends RegisterController {
  validateEmail() {
    if (value == null) {
      return;
    }
    isvalid(
        (value!.isNotEmpty) ? ValidationState.valid : ValidationState.invalid);
    if (isvalid.value == ValidationState.valid) {
      nextScreen();
    }
  }

  void nextScreen() {
    navigateToVerification();
  }

  void navigateToVerification() {
    Get.toNamed(verificationMobile, arguments: [uaeCode + value.toString()]);
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
          navigateToVerification();
        };
      case ValidationState.notChecked:
        return () {
          FocusManager.instance.primaryFocus?.unfocus();
          validateEmail();
        };
    }
  }
}
