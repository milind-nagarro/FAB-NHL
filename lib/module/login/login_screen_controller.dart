import 'package:fab_nhl/module/register/register_mobile_controller.dart';
import 'package:fab_nhl/route/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/Style.dart';
import '../../common/app_color.dart';
import '../../common/utilities/app_constants.dart';

/// Controller for login screen. also helps login pin screen for pin value
/// Subclassed from RegisterMobileController both handle mobile number validation
class LoginScreenController extends RegisterMobileController {
  /// flag to handle remember me check box state
  final rememberMeFlag = false.obs;

  /// to store pin value on pin screen
  var pin = "".obs;

  var errorPinCount = 3;
  var showErrorText = Rx<String?>(null);

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

  /// Validate PIN entered by the user and show error if retries are exceeded
  void validatePin() {
    if (errorPinCount == 0) {
      showErrorPinBottomSheet();
      return;
    }

    if (pin.value != "1234") {
      errorPinCount--;
      showErrorText('invalid_pin_number'.tr);
      print('Show error text value ${showErrorText.value}');
    } else {
      showErrorText(null);
      // Move to the next screen
    }
  }

  /// Error bottom sheet when exceeding maximum number of retries
  void showErrorPinBottomSheet() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
        height: 347.h,
        child: Column(
          children: [
            Stack(children: [
              SizedBox(
                width: double.infinity,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('error_message'.tr,
                      style: TextStyle(fontSize: 15.sp)),
                )),
              ),
              Positioned(
                  top: 13,
                  right: 13,
                  child: GestureDetector(
                    onTap: () {
                      navigator?.pop();
                    },
                    child: CircleAvatar(
                      radius: 10.r,
                      backgroundColor: greyBackground,
                      child: Image.asset(
                        'images/black_cross.png',
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                  ))
            ]),
            Container(
              color: separatorColor,
              width: double.infinity,
              height: 0.5.h,
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              padding: const EdgeInsets.only(top: 16),
              color: Colors.white,
              child: Center(
                child: Image.asset('images/error_red.png'),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Center(
                  child: Text(
                'exceeded_number_retries'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            SizedBox(
              height: 8.h,
            ),
            FABWidget.appButton('reset_my_pin'.tr,
                minSize: Size(179.w, 44.h), onPressed: () {}),
          ],
        ),
      ),
      isDismissible: true,
      enableDrag: true,
    );
  }
}
