import 'package:fab_nhl/module/setuppin/SetupConfirmController.dart';
import 'package:flutter/material.dart';
import 'package:fab_nhl/common/AppColor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/AppColor.dart';
import '../../common/Style.dart';
import '../../common/widgets/OnlyBottomCursor.dart';

class SetupConfirmPinPage extends StatefulWidget {
  const SetupConfirmPinPage({Key? key, required this.isConfirmation})
      : super(key: key);
  final bool isConfirmation;

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
      appBar: FABWidget.appTopBar(
          widget.isConfirmation ? 'confirm_pin'.tr : 'set_pin'.tr,
          hasCancel: widget.isConfirmation ? false : true,
          backAction: () {}),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.fromLTRB(12, 50, 0, 0)),
          SetupConfirmPin(forConfirmation: widget.isConfirmation),
          SizedBox(height: 33.h),
          Center(
              child: OnlyBottomCursor(
            controller: textController,
            focusNode: focusNode,
            onChange: (value) => {
              if (!widget.isConfirmation) controller.onPinTextChanged(value)
            },
            validator: (value) => _validations(value),
          )),
          const Spacer(),
          Obx(() => FABWidget.appButton(
              widget.isConfirmation ? 'confirm'.tr : 'next'.tr,
              bgColor:
                  controller.pin.value.length == 4 ? Colors.blue : Colors.grey,
              minSize: Size(100.w, 50.h),
              onPressed: () => _onClickListeners())),
          SizedBox(height: 33.h),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _onClickListeners() {
    if (controller.pin.value.length == 4) {
      if (widget.isConfirmation) {
        if (controller.pin.value == textController.text) {
          Get.defaultDialog(
            titlePadding: EdgeInsets.all(16.r),
            title: 'successful'.tr,
            content: Text('success_message'.tr),
            contentPadding: EdgeInsets.all(16.r),
          );
        } else {}
      } else {
        controller.navigateToConfirmPin();
      }
    } else {
      Get.defaultDialog(title: 'enter_pin'.tr);
    }
  }

  String? _validations(String? value) {
    if (widget.isConfirmation) {
      if (value != controller.pin.value) {
        return 'error_pin_match'.tr;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}

class SetupConfirmPin extends StatelessWidget {
  const SetupConfirmPin({Key? key, required this.forConfirmation})
      : super(key: key);
  final bool forConfirmation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          forConfirmation ? 'confirm_pin'.tr : 'set_pin'.tr,
          style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 21.sp),
        ),
        SizedBox(height: 8.h),
        Text(
          forConfirmation ? 'enter_pin_again'.tr : 'create_memorable_pin'.tr,
          style: TextStyle(
              fontStyle: FontStyle.normal, fontSize: 14.sp, color: lightGrey),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}