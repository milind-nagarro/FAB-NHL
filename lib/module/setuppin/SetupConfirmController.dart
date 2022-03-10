import 'package:fab_nhl/route/route_paths.dart' as path;
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SetupConfirmController extends GetxController {
  var pin = "".obs;

  void onPinTextChanged(String value) {
    pin(value);
  }

  void _navigateToConfirmPin() {
    Get.toNamed(path.confirmPin);
  }

  void onClickListeners(bool isConfirmation, String text) {
    if (pin.value.length == 4) {
      if (isConfirmation) {
        if (pin.value == text) {
          Get.defaultDialog(
            titlePadding: EdgeInsets.all(16.r),
            title: 'successful'.tr,
            content: Text('success_message'.tr),
            contentPadding: EdgeInsets.all(16.r),
          );
        } else {}
      } else {
        _navigateToConfirmPin();
      }
    } else {
      Get.defaultDialog(
        titlePadding: EdgeInsets.all(16.r),
        title: 'error_title'.tr,
        content: Text('enter_pin'.tr),
        contentPadding: EdgeInsets.all(16.r),
      );
    }
  }

  String? validations(bool isConfirmation, String? value) {
    if (isConfirmation) {
      if (value != pin.value) {
        return 'error_pin_match'.tr;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  void handleBackPress() {
    Get.defaultDialog(
        content: Text('pin_cancel_message'.tr),
        contentPadding: EdgeInsets.all(16.r),
        textConfirm: 'yes_cancel'.tr,
        textCancel: 'no_stay_here'.tr,
        onConfirm: () {
          navigateToRegistrationPage();
        },
        onCancel: () {
          // Do Nothing
        });
  }

  void navigateToRegistrationPage() {
    Get.until((route) => Get.currentRoute == path.registerMobile);
  }
}
