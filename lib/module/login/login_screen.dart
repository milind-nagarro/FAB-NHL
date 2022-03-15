import 'package:fab_nhl/common/app_color.dart';
import 'package:fab_nhl/common/style.dart';
import 'package:fab_nhl/module/login/bloc/login_bloc.dart';
import 'package:fab_nhl/module/login/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/utilities/app_constants.dart';

/// Login Screen widget.
/// Contains text field to input mobile number and display error if invalid number
/// used bloc to validate number and navigation to next screen
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginScreenController controller = Get.find();
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(),
      child: Scaffold(
        appBar: FABWidget.appTopBar('login'.tr),
        // bloc consumer for listening to login state for navigation and validation based UI
        body: BlocConsumer<LoginBloc, LoginState>(builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
              child: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('welcome_back'.tr,
                        style: FABStyles.subHeaderLabelStyle),
                    SizedBox(height: 8.h),
                    Text(
                      'login_header'.tr,
                      style: FABStyles.appStyleHeaderText(header),
                    ),
                    SizedBox(height: 40.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: (text) {
                          context
                              .read<LoginBloc>()
                              .add(LoginPhoneNumberChanged(text));
                        },
                        style: FABStyles.appStyleInputText,
                        decoration: InputDecoration(
                            filled: false,
                            prefixText: uaeCode,
                            labelText: 'mobile_number'.tr,
                            errorText: (state.loginStatus ==
                                    LoginStates.unauthenticated)
                                ? 'not_registered'.tr
                                : null,
                            suffixIcon: (state.loginStatus ==
                                    LoginStates.unauthenticated)
                                ? Image.asset('images/error.png')
                                : null,
                            errorMaxLines: 2),
                      ),
                      // })
                    ),
                    Row(children: [
                      Obx(
                        // observing controller for remember me to display selected state of checkbox
                        () => Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          value: (controller.rememberMeFlag.value == true),
                          onChanged: (bool? value) {
                            controller.rememberMe(value);
                          },
                          fillColor:
                              MaterialStateProperty.all(primaryLabelColor),
                        ),
                      ),
                      GestureDetector(
                        onTap: controller.toggleRememberMe,
                        child: Text('remember_me'.tr),
                      ),
                      const Spacer(),
                      FABWidget.smallTextButton('not_yet_registered'.tr,
                          onPressed: () =>
                              {controller.navigateToRegisterScreen()}),
                    ]),
                  ],
                ),
                Positioned(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SizedBox(
                        width: 116.w,
                        height: 56.h,
                        // observing controller for valid mobile number that will decide enable/disable state of next button
                        child:
                            // BlocBuilder<LoginBloc, LoginState>(
                            //   builder: (context, state) {
                            // return
                            FABWidget.appButton('next'.tr,
                                onPressed: nextStep(context, state)
                                //       );
                                // },
                                )),
                  ),
                ),
              ]),
            ),
          );
        }, // listener for navigation to next screen when login succeeds
            listener: (context, state) {
          if (state.loginStatus == LoginStates.authenticated) {
            nextScreen();
          }
        }),
      ),
    );
  }

  Function()? nextStep(BuildContext context, LoginState state) {
    if (state.loginStatus == LoginStates.unauthenticated) {
      return null;
    }
    switch (state.validationStatus) {
      case ValidationState.notChecked:
        return null;
      case ValidationState.invalid:
        return null;
      case ValidationState.valid:
        return () {
          FocusManager.instance.primaryFocus?.unfocus();
          context.read<LoginBloc>().add(const LoginSubmitted());
        };
    }
  }

  void nextScreen() {
    final LoginScreenController controller = Get.find();
    controller.nextScreen();
  }
}
