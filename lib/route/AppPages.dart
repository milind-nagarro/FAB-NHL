import 'package:fab_nhl/module/login/LoginScreen.dart';
import 'package:fab_nhl/module/login/LoginScreenBinder.dart';
import 'package:fab_nhl/module/register/RegisterMobile.dart';
import 'package:fab_nhl/module/register/RegisterMobileBinder.dart';
import 'package:fab_nhl/module/setuppin/SetupConfirmPinBinder.dart';
import 'package:fab_nhl/module/setuppin/SetupConfirmPinPage.dart';
import 'package:fab_nhl/module/verification/Verification.dart';
import 'package:fab_nhl/module/verification/VerificationBinder.dart';
import 'package:fab_nhl/module/welcome/Welcome.dart';
import 'package:fab_nhl/module/welcome/WelcomeBinder.dart';
import 'package:fab_nhl/route/RoutePaths.dart' as path;
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = path.welcome;

  static final routes = [
    GetPage(
        name: path.welcome, page: () => Welcome(), binding: WelcomeBinder()),
    GetPage(
        name: path.registerMobile,
        page: () => RegisterMobile(true),
        binding: RegisterMobileBinder()),
    GetPage(
        name: path.registerEmail,
        page: () => RegisterMobile(false),
        binding: RegisterMobileBinder()),
    GetPage(
        name: path.verification,
        page: () => Verification(),
        binding: VerificationBinder()),
    GetPage(
        name: path.setupPin,
        page: () => const SetupConfirmPinPage(),
        binding: SetupConfirmPinBinder()),
    GetPage(
        name: path.login,
        page: () => const LoginScreen(),
        binding: LoginScreenBinder()),
  ];
}
