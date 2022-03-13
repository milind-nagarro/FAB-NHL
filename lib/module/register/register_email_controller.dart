import 'package:fab_nhl/module/verification/verification_controller.dart';
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

  @override
  void onBackPress() {
    Get.until((route) => Get.currentRoute == registerMobile);
  }

  void navigateToVerification() {
    Get.delete<VerificationController>(force: true);
    Get.toNamed(verificationEmail, arguments: [value.toString(), false]);
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
