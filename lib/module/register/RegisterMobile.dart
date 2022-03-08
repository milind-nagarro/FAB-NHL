import 'package:fab_nhl/common/AppColor.dart';
import 'package:fab_nhl/common/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';

class RegisterMobile extends StatelessWidget {
  const RegisterMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Instantiate your class using Get.put() to make it available for all "child" routes there.
    return Scaffold(
        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'enter_mobile'.tr,
                style: TextStyle(
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w600,
                    color: header,
                    fontFamily: 'Graphik'),
              ),
              SizedBox(height: 8.h),
              Text(
                'enter_mobile_adha'.tr,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: subHeader,
                    fontFamily: 'SF Pro Text'),
              ),
              SizedBox(height: 23.h),
              Text(
                'mobile_number'.tr,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: hintLabel,
                    fontFamily: 'SF Pro Text'),
              ),
              const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: false,
                  ))
            ],
          ),
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                    style: appBtnStyle(primaryLabelColor),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'next'.tr,
                      style: btnTitleStyle(Colors.white),
                    )),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
