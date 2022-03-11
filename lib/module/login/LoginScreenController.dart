import 'package:fab_nhl/common/AppColor.dart';
import 'package:fab_nhl/module/register/RegisterMobileController.dart';
import 'package:fab_nhl/route/RoutePaths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/Style.dart';

class LoginScreenController extends RegisterMobileController {
  final rememberMeFlag = false.obs;

  var pin = "".obs;
  var errorPinCount = 3;
  var showErrorText = "".obs;

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

  void validatePin() {
    showErrorPinBottomSheet();
    return;
    if (errorPinCount == 0) {}

    if (pin.value != "1234") {
      errorPinCount--;
      showErrorText('invalid_pin_number'.tr);
    } else {
      showErrorText('');
      // Move to the next screen
    }
  }

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
