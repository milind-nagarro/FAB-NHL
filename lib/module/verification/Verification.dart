import 'package:fab_nhl/common/app_color.dart';
import 'package:fab_nhl/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../common/widgets/OnlyBottomCursor.dart';
import 'VerificationController.dart';

class Verification extends StatelessWidget {
  const Verification(this.isMobile);
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final VerificationController controller = Get.find();

    return Scaffold(
        appBar: FABWidget.appTopBar('your_otp'.tr),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
            child: Container(
              child: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('enter_verification'.tr,
                        style: FABStyles.appStyleHeaderText(header)),
                    SizedBox(height: 8.h),
                    Text(
                        'verification_sent_msg'.tr +
                            " (" +
                            controller.mobileNumber +
                            ")",
                        style: FABStyles.subHeaderLabelStyle),
                    SizedBox(height: 16.h),
                    Center(
                        child: OnlyBottomCursor(
                      controller: controller.textController,
                      focusNode: controller.focusNode,
                      length: 6,
                      onChange: (value) => {controller.onPinTextChanged(value)},
                    )),
                    SizedBox(height: 16.h),
                    Countdown(
                      seconds: 180,
                      build: (BuildContext context, double time) => Text(
                          'otp_expire_msg'.tr +
                              controller.formatedTime(time.round()),
                          style: FABStyles.subHeaderLabelStyle,
                          textAlign: TextAlign.center),
                      interval: const Duration(milliseconds: 1000),
                      onFinished: () {
                        print('Timer is done!');
                      },
                    ),
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
                        child: Obx(() => FABWidget.appButton('next'.tr,
                            onPressed: (controller.pin.value.length == 6)
                                ? controller.navigateToEmailRegister
                                : null))),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
