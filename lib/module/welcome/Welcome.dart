import 'dart:ui';

import 'package:fab_nhl/module/welcome/WelcomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fab_nhl/utilities/page_indicator.dart';
import 'package:fab_nhl/utilities/constants.dart';

// class Welcome extends StatelessWidget {
//   const Welcome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final WelcomeController controller = Get.find();
// // Instantiate your class using Get.put() to make it available for all "child" routes there.
//     return Scaffold(
//       // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
//       body: Center(
//           child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           GestureDetector(
//               child: Text(
//                 controller.selectedLanguage,
//                 style: TextStyle(fontSize: 25),
//               ),
//               onTap: controller.changeLanguage),
//           ElevatedButton(
//               child: Text('login'.tr),
//               onPressed: () => controller.navigateToLogin()),
//           Container(
//             margin: const EdgeInsets.only(top: 10),
//             child: ElevatedButton(
//                 child: Text('register'.tr),
//                 onPressed: () => controller.navigateToRegister()),
//           ),
//         ],
//       )),
//     );
//   }
// }

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bottom buttons login register
    final WelcomeController controller = Get.find();
    Widget bottomButtons = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // button sizes are proportional to screen width
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final width = constraints.maxWidth * 0.8;
          final height = width * 0.18;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.grey,
                shadowColor: Colors.grey,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(width, height),
              ),
              onPressed: () {
                controller.navigateToLogin();
              },
              child: Text(
                'login'.tr,
                style: const TextStyle(
                    color: Colors.blue, fontFamily: 'SF Pro', fontSize: 16),
              ),
            ),
          );
        }),
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final width = constraints.maxWidth * 0.8;
          final height = width * 0.18;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white.withOpacity(0.15),
                  onPrimary: Colors.white,
                  shadowColor: Colors.grey,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: Size(width, height),
                ),
                onPressed: () {
                  controller.navigateToRegister();
                },
                child: Text(
                  'register'.tr,
                  style: const TextStyle(
                      color: Colors.white, fontFamily: 'SF Pro', fontSize: 16),
                ),
              ),
            ),
          );
        }),
        // for space at bottom
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final width = constraints.maxWidth * 0.8;
          final height = width * 0.2;
          return SizedBox(width: width, height: height);
        })
      ],
    );

// top portion for logo and text
    Widget topPortion = Padding(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, bottom: 20, right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('images/topLogo.png'),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    onPrimary: Colors.grey,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: controller.changeLanguage,
                  child: Text(
                    controller.selectedLanguage,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Obx(() => Text(
                controller.welcomeMessage.value.tr,
                style: const TextStyle(
                  fontSize: 28,
                  fontFamily: "Graphik",
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              )),
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(top: 15),
              child: buildPageIndicator(
                  titles.length, controller.currentPage.value),
            ),
          ),
        ],
      ),
    );

    Widget page1 = LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const SizedBox(),
      );
    });
    Widget page2 = LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const SizedBox(),
      );
    });

    Widget page3 = LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const SizedBox(),
      );
    });

    PageController pgcontroller = PageController(
      initialPage: 0,
    );
    Widget pageView = PageView(
        onPageChanged: (page) {
          controller.setPage(page);
        },
        controller: pgcontroller,
        children: [
          page1,
          page2,
          page3,
        ]);

    Widget stack = Stack(
      children: [
        pageView,
        Positioned(
          child: topPortion,
          top: 0,
          left: 0,
          right: 0,
        ),
        Positioned(
          child: bottomButtons,
          bottom: 0,
          left: 0,
          right: 0,
        )
      ],
    );

    return Scaffold(body: stack);
  }
}
