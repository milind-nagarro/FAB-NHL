import 'package:fab_nhl/module/setuppin/SetupConfirmController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/AppColor.dart';
import '../../common/widgets/OnlyBottomCursor.dart';

class SetupConfirmPinPage extends StatefulWidget {
  const SetupConfirmPinPage({Key? key}) : super(key: key);

  @override
  State<SetupConfirmPinPage> createState() => _SetupConfirmPinPageState();
}

class _SetupConfirmPinPageState extends State<SetupConfirmPinPage>
    with AutomaticKeepAliveClientMixin {
  SetupConfirmController setupConfirmController = Get.put(SetupConfirmController());

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'set_pin'.tr,
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 64, 24, 24),
        child: Column(
            children: [
              const SetupConfirmPin(),
              SizedBox(height: 33.h),
              const Center(child: OnlyBottomCursor()),
              const Spacer(),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'next'.tr,
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 21.sp),
                ),
              ),
              SizedBox(height: 33.h),
            ],
          ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class SetupConfirmPin extends StatelessWidget {
  const SetupConfirmPin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'set_pin'.tr,
          style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 21.sp),
        ),
        SizedBox(height: 8.h),
        Text(
          'create_memorable_pin'.tr,
          style: TextStyle(
              fontStyle: FontStyle.normal, fontSize: 14.sp, color: lightGrey),
        ),
      ],
    );
  }
}
