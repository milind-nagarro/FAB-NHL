import 'package:fab_nhl/common/AppColor.dart';
import 'package:fab_nhl/common/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'VerificationController.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VerificationController controller = Get.find();

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
        child: Container(
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('enter_verification'.tr, style: headerLabelStyle(header)),
                SizedBox(height: 8.h),
                Text('verification_sent_msg'.tr, style: subHeaderLabelStyle),
                const TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: false,
                    )
                ),
                SizedBox(height: 100.h),
                SizedBox(
                    width: double.infinity,
                    child: Text('otp_expire_msg'.tr, style: subHeaderLabelStyle,textAlign: TextAlign.center)
                ),
                SizedBox(height: 16.h),
                SizedBox(
                    width: double.infinity,
                    child: Text('resend_code'.tr, style: redirectLabelStyle,textAlign: TextAlign.center)
                ),
              ],
            ),
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  width: 116.w,
                  height: 56.h,
                  child: ElevatedButton(
                      style: activeButtonStyle,
                      onPressed: () => {controller.navigateToEmailRegister()},
                      child: Text('next'.tr, style: activeButtonTextStyle)),
                ),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
