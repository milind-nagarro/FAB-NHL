import 'package:fab_nhl/route/RoutePaths.dart';
import 'package:get/get.dart';

enum MobileValidationState { notChecked, valid, invalid }

class RegisterMobileController extends GetxController {
  final isvalidMobile = MobileValidationState.notChecked.obs;
  String? _mobileNumber;

  setMobileNumber(String number) {
    _mobileNumber = number;
  }

  validatePhone() {
    if (_mobileNumber == null) {
      return;
    }
    isvalidMobile((_mobileNumber!.isNotEmpty && _mobileNumber!.length > 5)
        ? MobileValidationState.valid
        : MobileValidationState.invalid);
  }

  void navigateToVerification() {
    Get.toNamed(verification);
  }
}
