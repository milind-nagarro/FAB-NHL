import 'package:fab_nhl/module/welcome/WelcomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WelcomeController controller = Get.find();
// Instantiate your class using Get.put() to make it available for all "child" routes there.
    return Scaffold(
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
              child: Text(
                controller.selectedLanguage,
                style: TextStyle(fontSize: 25),
              ),
              onTap: controller.changeLanguage),
          ElevatedButton(
              child: Text('login'.tr),
              onPressed: () => controller.navigateToLogin()),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
                child: Text('register'.tr),
                onPressed: () => controller.navigateToRegister()),
          ),
        ],
      )),
    );
  }
}
