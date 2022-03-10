import 'package:fab_nhl/common/app_color.dart';
import 'package:fab_nhl/module/setuppin/SetupConfirmController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import '../../common/style.dart';
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
          hasCancel: widget.isConfirmation ? false : true, backAction: () {
        handleBackPress();
      }),
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
            validator: (value) =>
                controller.validations(widget.isConfirmation, value),
          )),
          const Spacer(),
          Obx(() => FABWidget.appButton(
              widget.isConfirmation ? 'confirm'.tr : 'next'.tr,
              bgColor:
                  controller.pin.value.length == 4 ? Colors.blue : Colors.grey,
              minSize: Size(100.w, 50.h),
              onPressed: () => controller.onClickListeners(
                  widget.isConfirmation, textController.text))),
          SizedBox(height: 33.h),
        ],
      ),
    );
  }

  void handleBackPress() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text('pin_cancel_message'.tr),
            actions: [
              CupertinoDialogAction(
                  child: Text('yes_cancel'.tr),
                  onPressed: () {
                    controller.navigateToRegistrationPage();
                  }),
              CupertinoDialogAction(
                child: Text('no_stay_here'.tr),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
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
