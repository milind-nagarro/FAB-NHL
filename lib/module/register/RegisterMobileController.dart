import 'package:fab_nhl/route/RoutePaths.dart';
import 'package:get/get.dart';

enum MobileValidationState { notChecked, valid, invalid }

class RegisterMobileController extends GetxController {
  // invalid number will show error message and disable next button
  final isvalidMobile = MobileValidationState.notChecked.obs;
  // blank number will only disable next button
  final isNumberBlank = true.obs;

  String? _mobileNumber;

  setMobileNumber(String number) {
    isNumberBlank(number.isEmpty);
    _mobileNumber = number;
    // reset value when number changes so that next button is enabled
    isvalidMobile(MobileValidationState.notChecked);
  }

  validatePhone() {
    if (_mobileNumber == null) {
      return;
    }
    isvalidMobile((_mobileNumber!.isNotEmpty && _mobileNumber == '555555555')
        ? MobileValidationState.valid
        : MobileValidationState.invalid);
    if (isvalidMobile.value == MobileValidationState.valid) {
      navigateToVerification();
    }
  }

  void navigateToVerification() {
    Get.toNamed(verification);
  }
}
