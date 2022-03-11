import 'package:fab_nhl/module/login/unlock_pin_controller.dart';
import 'package:get/get.dart';

class UnlockPinScreenBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UnlockPinController());
  }
}
