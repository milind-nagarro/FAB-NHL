import 'package:fab_nhl/module/setuppin/setup_confirm_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/Style.dart';
import '../../common/app_color.dart';
import '../../common/widgets/pin_input_widget.dart';

///
/// Handles both Setting up and confirming the pin using [isConfirmation] constructor parameter
/// to handle both the states
///
class SetupConfirmPinPage extends StatelessWidget {
  SetupConfirmPinPage({Key? key, required this.isConfirmation})
      : super(key: key);
  final bool isConfirmation;

  final SetupConfirmController controller = Get.find();
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FABWidget.appTopBar(
          isConfirmation ? 'confirm_pin'.tr : 'set_pin'.tr,
          hasCancel: isConfirmation ? false : true, backAction: () {
        handleBackPress(context);
      }),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.fromLTRB(12, 50, 0, 0)),
          SetupConfirmPin(forConfirmation: isConfirmation),
          SizedBox(height: 33.h),
          Center(
              child: PinInputWidget(
            controller: textController,
            focusNode: focusNode,
            errorText: Rx<String?>(null),
            onChange: (value) =>
                {if (!isConfirmation) controller.onPinTextChanged(value)},
            validator: (value) => controller.validations(isConfirmation, value),
          )),
          const Spacer(),
          Obx(() => FABWidget.appButton(
              isConfirmation ? 'confirm'.tr : 'next'.tr,
              bgColor: controller.pin.value.length == 4
                  ? primaryLabelColor
                  : Colors.grey,
              minSize: Size(100.w, 50.h),
              onPressed: () => controller.onClickListeners(
                  isConfirmation, textController.text))),
          SizedBox(height: 33.h),
        ],
      ),
    );
  }

  void handleBackPress(context) {
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
}
