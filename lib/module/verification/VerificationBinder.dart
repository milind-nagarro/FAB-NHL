import 'package:get/get.dart';

import 'VerificationController.dart';

class VerificationBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationController());
  }
}
