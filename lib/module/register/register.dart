import 'package:fab_nhl/common/app_color.dart';
import 'package:fab_nhl/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/utilities/app_constants.dart';
import 'register_controller.dart';
import 'register_email_controller.dart';
import 'register_mobile_controller.dart';

/// widget to create register mobile and email screen
/// pass constructor 'true' registering for mobile,'false' for email
class Register extends StatelessWidget {
  const Register(this.isMobile);
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = isMobile
        ? Get.find<RegisterMobileController>()
        : Get.find<RegisterEmailController>();

    return Scaffold(
        appBar: FABWidget.appTopBar('register'.tr,
            hasCancel: true, backAction: controller.onBackPress),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(isMobile ? 'enter_mobile'.tr : 'enter_email'.tr,
                      style: FABStyles.appStyleHeaderText(header)),
                  SizedBox(height: 8.h),
                  Text(
                      isMobile
                          ? 'enter_mobile_adha'.tr
                          : 'enter_email_valid'.tr,
                      style: FABStyles.subHeaderLabelStyle),
                  SizedBox(height: 23.h),
                  Obx(
                    () => TextField(
                      keyboardType: isMobile
                          ? TextInputType.phone
                          : TextInputType.emailAddress,
                      onChanged: (text) {
                        controller.setValue(
                            text); // isMobileVerification ? mobileController.setValue(text)  : emailController.setValue(text);
                      },
                      style: FABStyles.appStyleInputText,
                      decoration: InputDecoration(
                          filled: false,
                          prefixText: isMobile ? uaeCode : null,
                          labelText: isMobile ? 'mobile_number'.tr : 'email'.tr,
                          errorText: controller.getErrorText(),
                          suffixIcon: controller.getSuffixIcon(),
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
                        onPressed:
                            controller.nextStep(controller.isvalid.value))),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
