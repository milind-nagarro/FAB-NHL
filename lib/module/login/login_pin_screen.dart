import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import '../../common/style.dart';
import '../../common/widgets/pin_input_widget.dart';
import 'login_screen_controller.dart';

class LoginPinScreen extends StatelessWidget {
  const LoginPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginScreenController controller = Get.find();

    TextEditingController textController = TextEditingController();
    FocusNode focusNode = FocusNode();

    // TODO: implement build
    return Scaffold(
      appBar: FABWidget.appTopBar('pin'.tr),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            children: [
              Text('welcome_back'.tr, style: FABStyles.subHeaderLabelStyle),
              SizedBox(height: 8.h),
              Text(
                'type_pin_number'.tr,
                style: FABStyles.appStyleHeaderText(header),
              ),
              SizedBox(height: 33.h),
              Center(
                  child: PinInputWidget(
                      controller: textController,
                      focusNode: focusNode,
                      errorText: controller.showErrorText,
                      onChange: (value) => {controller.onPinTextChanged(value)},
                      validator: (value) {})),
              SizedBox(height: 16.h),
              Text(
                'forgot_your_pin'.tr,
                style: const TextStyle(color: borderColor),
              ),
              const Spacer(),
              Obx(() => FABWidget.appButton('next'.tr,
                  bgColor: controller.pin.value.length == 4
                      ? Colors.blue
                      : Colors.grey,
                  minSize: Size(100.w, 50.h),
                  onPressed: () => {controller.validatePin()})),
              SizedBox(height: 33.h),
            ],
          ),
        ),
      ),
    );
  }
}
