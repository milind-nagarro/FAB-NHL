import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../common/utilities/app_constants.dart';

/// Super class for register mobile and email controller
abstract class RegisterController extends GetxController {
  // invalid value(email,mobile) will show error message and disable next button
  final isvalid = ValidationState.notChecked.obs;
  // blank value will only disable next button
  final isValueBlank = true.obs;
  String? value;

  Function()? nextStep(ValidationState vState);

  setValue(String updatedValue) {
    isValueBlank(updatedValue.isEmpty);
    value = updatedValue;
    // reset value when number changes so that next button is enabled
    isvalid(ValidationState.notChecked);
  }

  String? getErrorText() {
    return (isvalid.value == ValidationState.invalid)
        ? 'invalid_mobile_number'.tr
        : null;
  }

  Widget? getSuffixIcon() {
    return (isvalid.value == ValidationState.invalid)
        ? Image.asset('images/error.png')
        : null;
  }
}
