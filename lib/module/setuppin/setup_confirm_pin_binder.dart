import 'package:fab_nhl/module/setuppin/setup_confirm_controller.dart';
import 'package:get/get.dart';

class SetupConfirmPinBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetupConfirmController());
  }
}
