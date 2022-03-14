import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/style.dart';

/// Widget for unlock pin screen
/// Should contain keypad like grid to enter pin
/// Not user/implemented as of now
class UnlockPinScreen extends StatelessWidget {
  const UnlockPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FABWidget.appTopBar('pin'.tr),
        body: const SafeArea(
          child: Center(
            child: Icon(Icons.pin),
          ),
        ));
  }
}
