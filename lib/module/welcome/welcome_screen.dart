import 'dart:ui';

import 'package:fab_nhl/common/AppColor.dart';
import 'package:fab_nhl/common/Style.dart';
import 'package:fab_nhl/common/utilities/app_constants.dart';
import 'package:fab_nhl/module/welcome/welcome_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fab_nhl/common/utilities/page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WelcomeController controller = Get.find();
    const btnWidth = 312.0;
    const btnHeight = 56.0;
    final bottomSpace = 90.h;
    final topSpace = 80.h;
    final leadingTrailingSpace = 32.w;

// bottom buttons login register
    Widget bottomButtons = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FABWidget.appButton(
          'login'.tr,
          onPressed: () => {controller.navigateToLogin()},
          bgColor: Colors.white,
          minSize: const Size(btnWidth, btnHeight),
          textColor: primaryLabelColor,
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
            child: FABWidget.appButton('register'.tr,
                onPressed: () => {controller.navigateToRegister()},
                bgColor: Colors.white.withOpacity(0.15)),
          ),
        ),
      ],
    );

// top portion for logo and language switch btn
    Widget topPortion = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 0, bottom: 20.h, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('images/topLogo.png'),
              TextButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.grey,
                  shadowColor: Colors.transparent,
                ),
                onPressed: controller.changeLanguage,
                child: Text(
                  controller.languageTitle,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => Text(
            controller.welcomeMessage.value.tr,
            style: FABStyles.appStyleHeaderText(Colors.white),
          ),
        ),
        Obx(
          () => Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: buildPageIndicator(
                welcomeScreenTitles.length, controller.currentPage.value),
          ),
        ),
      ],
    );

// scrollable images
    List<Widget> bgImages = [];
    for (var i = 1; i <= welcomeScreenTitles.length; i++) {
      bgImages.add(LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg$i.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: const SizedBox(),
        );
      }));
    }

    PageController pgcontroller = PageController(
      initialPage: 0,
    );
    Widget pageView = PageView(
        onPageChanged: (page) {
          controller.setPage(page);
        },
        controller: pgcontroller,
        children: bgImages);

// stack to lay text and buttons above page view
    Widget stack = Stack(
      children: [
        pageView,
        Positioned(
          child: topPortion,
          top: topSpace,
          left: leadingTrailingSpace,
          right: leadingTrailingSpace,
        ),
        Positioned(
          child: bottomButtons,
          bottom: bottomSpace,
          left: 0,
          right: 0,
        )
      ],
    );

    return Scaffold(body: stack);
  }
}
