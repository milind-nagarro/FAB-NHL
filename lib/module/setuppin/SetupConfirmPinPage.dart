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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 50, 0, 0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Cancel',
                  style: TextStyle(color: smallTextColor),
                )),
          ),
          SizedBox(height: 33.h),
          const SetupConfirmPin(),
          SizedBox(height: 33.h),
          Center(
              child: OnlyBottomCursor(
                  controller: textController, 
                  focusNode: focusNode,
                onChange: (value) => {
                    controller.onPinTextChanged(value)
                },
              )),
          const Spacer(),
          FABWidget.appButton('next'.tr,
              minSize: Size(100.w, 50.h), onPressed: () {}),
          SizedBox(height: 33.h),
        ],
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
