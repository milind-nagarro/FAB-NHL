import 'package:fab_nhl/common/AppColor.dart';
import 'package:fab_nhl/common/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'VerificationController.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VerificationController controller = Get.find();

    return Scaffold(
        appBar: FABWidget.appTopBar('your_otp'.tr),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('enter_verification'.tr,
                      style: FABStyles.appStyleHeaderText(header)),
                  SizedBox(height: 8.h),
                  Text('verification_sent_msg'.tr,
                      style: FABStyles.subHeaderLabelStyle),
                  const TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: false,
                      )),
                  SizedBox(height: 100.h),
                  SizedBox(
                      width: double.infinity,
                      child: Text('otp_expire_msg'.tr,
                          style: FABStyles.subHeaderLabelStyle,
                          textAlign: TextAlign.center)),
                  SizedBox(height: 16.h),
                  SizedBox(
                      width: double.infinity,
                      child: Text('resend_code'.tr,
                          style: FABStyles.redirectLabelStyle,
                          textAlign: TextAlign.center)),
                ],
              ),
              Positioned(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                      width: 116.w,
                      height: 56.h,
                      child: FABWidget.appButton('next'.tr,
                          onPressed: () =>
                              {controller.navigateToEmailRegister()})),
                ),
              ),
            ]),
          ),
        ));
  }
}
