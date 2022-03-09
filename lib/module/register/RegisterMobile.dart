import 'package:fab_nhl/common/AppColor.dart';
import 'package:fab_nhl/common/Style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

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
            child: Container(
              child: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(isMobileVerification ? 'enter_mobile'.tr : 'enter_email'.tr, style: headerLabelStyle(header)),
                    SizedBox(height: 8.h),
                    Text(isMobileVerification ?'enter_mobile_adha'.tr : 'enter_email_valid'.tr, style: subHeaderLabelStyle),
                    SizedBox(height: 23.h),
                    Text(isMobileVerification ?'mobile_number'.tr:'email'.tr, style: redirectLabelStyle),
                    TextField(
                        keyboardType: isMobileVerification ? TextInputType.phone : TextInputType.emailAddress,
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
                      child: Obx(()=> ElevatedButton(
                          style: activeButtonStyle,
                          onPressed: (controller.isvalidMobile.value && isMobileVerification) ? () => {controller.navigateToVerification()} : null,
                          // onPressed: isMobileVerification ? (controller.isvalidMobile.value ? () => {controller.navigateToVerification()} : null) : null,
                          child: Text('next'.tr, style: activeButtonTextStyle))) ,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }



}