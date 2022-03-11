import 'package:fab_nhl/module/login/login_pin_screen.dart';
import 'package:fab_nhl/module/login/LoginScreen.dart';
import 'package:fab_nhl/module/login/LoginScreenBinder.dart';
import 'package:fab_nhl/module/register/RegisterMobile.dart';
import 'package:fab_nhl/module/register/RegisterMobileBinder.dart';
import 'package:fab_nhl/module/setuppin/setup_confirm_pin_binder.dart';
import 'package:fab_nhl/module/setuppin/setup_confirm_pin_page.dart';
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
        name: path.welcome,
        page: () => const Welcome(),
        binding: WelcomeBinder()),
    GetPage(
        name: path.registerMobile,
        page: () => const RegisterMobile(true),
        binding: RegisterMobileBinder()),
    GetPage(
        name: path.registerEmail,
        page: () => const RegisterMobile(false),
        binding: RegisterMobileBinder()),
    GetPage(
        name: path.verification,
        page: () => const Verification(),
        binding: VerificationBinder()),
    GetPage(
        name: path.setupPin,
        page: () => SetupConfirmPinPage(
              isConfirmation: false,
            ),
        binding: SetupConfirmPinBinder()),
    GetPage(
        name: path.login,
        page: () => const LoginScreen(),
        binding: LoginScreenBinder()),
    GetPage(
        name: path.confirmPin,
        page: () => SetupConfirmPinPage(isConfirmation: true),
        binding: SetupConfirmPinBinder()),
    GetPage(
      name: path.loginPin,
      page: () => const LoginPinScreen(),
      binding: LoginScreenBinder()),
  ];
}
