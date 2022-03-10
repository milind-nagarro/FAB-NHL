import 'package:fab_nhl/common/AppColor.dart';
import 'package:fab_nhl/common/Style.dart';
import 'package:fab_nhl/module/login/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/utilities/app_constants.dart';
import '../register/register_mobile_controller.dart';

/// Login Screen widget.
/// Contains text field to input mobile number and display error if invalid number
/// Controller validates number and next button listens to valid state result
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginScreenController controller = Get.find();
    return Scaffold(
        appBar: FABWidget.appTopBar('login'.tr),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('welcome_back'.tr, style: FABStyles.subHeaderLabelStyle),
                  SizedBox(height: 8.h),
                  Text(
                    'login_header'.tr,
                    style: FABStyles.appStyleHeaderText(header),
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Obx(
                      // observing controller for validity of mobile number
                      () => TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: (text) {
                          controller.setMobileNumber(text);
                        },
                        style: FABStyles.appStyleInputText,
                        decoration: InputDecoration(
                            filled: false,
                            prefixText: uaeCode,
                            labelText: 'mobile_number'.tr,
                            errorText: (controller.isvalidMobile.value ==
                                    MobileValidationState.invalid)
                                ? 'not_registered'.tr
                                : null,
                            suffixIcon: (controller.isvalidMobile.value ==
                                    MobileValidationState.invalid)
                                ? Image.asset('images/error.png')
                                : null,
                            errorMaxLines: 2),
                      ),
                    ),
                  ),
                  Row(children: [
                    Obx(
                      // observing controller for remember me to display selected state of checkbox
                      () => Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        value: (controller.rememberMeFlag.value == true),
                        onChanged: (bool? value) {
                          controller.rememberMe(value);
                        },
                        fillColor: MaterialStateProperty.all(primaryLabelColor),
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.toggleRememberMe,
                      child: Text('remember_me'.tr),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () => {controller.navigateToRegisterScreen()},
                      child: Text('not_yet_registered'.tr),
                    ),
                  ]),
                ],
              ),
              Positioned(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                    width: 116.w,
                    height: 56.h,
                    // observing controller for valid mobile number that will decide enable/disable state of next button
                    child: Obx(() => FABWidget.appButton('next'.tr,
                        onPressed: nextStep(controller.isvalidMobile))),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }

  // return a function or null to disable next button based on mobile number validation state
  Function()? nextStep(Rx<MobileValidationState> vState) {
    final LoginScreenController controller = Get.find();
    if (controller.isNumberBlank.value) {
      return null;
    }
    switch (vState.value) {
      case MobileValidationState.invalid:
        return null;
      case MobileValidationState.valid:
        return () {
          FocusManager.instance.primaryFocus?.unfocus();
          controller.nextScreen();
        };
      case MobileValidationState.notChecked:
        return () {
          FocusManager.instance.primaryFocus?.unfocus();
          controller.validatePhone();
        };
    }
  }
}
