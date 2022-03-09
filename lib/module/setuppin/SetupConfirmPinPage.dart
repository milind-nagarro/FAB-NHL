import 'package:fab_nhl/module/setuppin/SetupConfirmController.dart';
import 'package:flutter/material.dart';
import 'package:fab_nhl/common/AppColor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/AppColor.dart';
import '../../common/Style.dart';
import '../../common/widgets/OnlyBottomCursor.dart';

class SetupConfirmPinPage extends StatefulWidget {
  const SetupConfirmPinPage({Key? key}) : super(key: key);

  @override
  State<SetupConfirmPinPage> createState() => _SetupConfirmPinPageState();
}

class _SetupConfirmPinPageState extends State<SetupConfirmPinPage>
    with AutomaticKeepAliveClientMixin {
  final SetupConfirmController controller = Get.find();
  TextEditingController textController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar:
          FABWidget.appTopBar('set_pin'.tr),
      body: Column(
        children: [
          SizedBox(height: 33.h),
          Column(
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
          ),
          SizedBox(height: 33.h),
          Center(
              child: OnlyBottomCursor(
            controller: textController,
            focusNode: focusNode,
            onChange: (value) => {controller.onPinTextChanged(value)},
          )),
          const Spacer(),
          Obx(()=>FABWidget.appButton('next'.tr,
              minSize: Size(100.w, 50.h), onPressed: (controller.pin.value.length == 4) ? () {} : null)),
          SizedBox(height: 33.h),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}