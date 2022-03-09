import 'package:fab_nhl/module/setuppin/SetupConfirmController.dart';
import 'package:get/get.dart';

class SetupConfirmPinBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetupConfirmController());
  }
}
