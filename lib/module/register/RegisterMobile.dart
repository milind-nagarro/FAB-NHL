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

  @override
  Widget build(BuildContext context) {
    final RegisterMobileController controller = Get.find();

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
              Text(isMobileVerification ? 'mobile_number'.tr : 'email'.tr,
                  style: FABStyles.redirectLabelStyle),
              TextField(
                  keyboardType: isMobileVerification
                      ? TextInputType.phone
                      : TextInputType.emailAddress,
                  onChanged: (text) {
                    controller.validatePhone(text);
                  },
                  decoration: const InputDecoration(
                    filled: false,
                  ))
            ],
          ),
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: SizedBox(
                width: 116.w,
                height: 56.h,
                child: Obx(() => FABWidget.appButton(
                      'next'.tr,
                      onPressed: (controller.isvalidMobile.value &&
                              isMobileVerification)
                          ? () => {controller.navigateToVerification()}
                          : null,
                    )),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
