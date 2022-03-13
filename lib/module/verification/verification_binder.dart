import 'package:get/get.dart';

import 'verification_controller.dart';

class VerificationBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationController());
  }
}
