import 'package:fab_nhl/module/welcome/WelcomeController.dart';
import 'package:get/get.dart';

class WelcomeBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
  }
}
