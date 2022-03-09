import 'package:fab_nhl/common/AppColor.dart';
import 'package:fab_nhl/common/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'RegisterMobileController.dart';

class RegisterMobile extends StatelessWidget {
  // const RegisterMobile({Key? key}) : super(key: key);

  const RegisterMobile(this.isMobileVerification);

  final bool isMobileVerification;

  static final RegisterMobileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(isMobileVerification ? 'enter_mobile'.tr : 'enter_email'.tr,
                  style: FABStyles.appStyleHeaderText(header)),
              SizedBox(height: 8.h),
              Text(
                  isMobileVerification
                      ? 'enter_mobile_adha'.tr
                      : 'enter_email_valid'.tr,
                  style: FABStyles.subHeaderLabelStyle),
              SizedBox(height: 23.h),
              Obx(
                () => TextField(
                  keyboardType: isMobileVerification
                      ? TextInputType.phone
                      : TextInputType.emailAddress,
                  onChanged: (text) {
                    controller.setMobileNumber(text);
                  },
                  decoration: InputDecoration(
                      filled: false,
                      labelText: isMobileVerification
                          ? 'mobile_number'.tr
                          : 'email'.tr,
                      // labelStyle: FABStyles.redirectLabelStyle,
                      errorText: (controller.isvalidMobile.value ==
                              MobileValidationState.invalid)
                          ? 'invalid_mobile_number'.tr
                          : null,
                      errorMaxLines: 2),
                ),
              ),
            ],
          ),
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: SizedBox(
                width: 116.w,
                height: 56.h,
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
    if (isMobileVerification) {
      switch (vState.value) {
        case MobileValidationState.invalid:
          return null;
        case MobileValidationState.valid:
          return () {
            FocusManager.instance.primaryFocus?.unfocus();
            controller.navigateToVerification();
          };
        case MobileValidationState.notChecked:
          return () {
            FocusManager.instance.primaryFocus?.unfocus();
            controller.validatePhone();
          };
      }
    } else {
      return () {};
    }
  }
}
