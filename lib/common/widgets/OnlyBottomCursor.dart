import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../AppColor.dart';

class OnlyBottomCursor extends StatefulWidget {
  const OnlyBottomCursor({Key? key}) : super(key: key);

  @override
  _OnlyBottomCursorState createState() => _OnlyBottomCursorState();
}

class _OnlyBottomCursorState extends State<OnlyBottomCursor> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 44.w,
      height: 56.h,
      textStyle: GoogleFonts.poppins(
        fontSize: 22.sp,
        color: Colors.black,
      ),
      decoration: const BoxDecoration(),
    );

    final submittedPinTheme = PinTheme(
      width: 44.w,
      height: 56.h,
      textStyle: GoogleFonts.poppins(
        fontSize: 22.sp,
        color: Colors.black,
      ),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 3, color: Colors.black26))),
    );

    final focusedPinTheme = PinTheme(
      width: 44.w,
      height: 56.h,
      textStyle: GoogleFonts.poppins(
        fontSize: 22.sp,
        color: borderColor,
      ),
      decoration: const BoxDecoration(
        color: cursorColor,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(color: cursorColor, spreadRadius: 0),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
    );

    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 44.w,
          height: 2.h,
          decoration: const BoxDecoration(
            color: Colors.black26,
          ),
        ),
      ],
    );

    return Pinput(
      key: const Key("PinputWidget"),
      length: 4,
      pinAnimationType: PinAnimationType.slide,
      controller: controller,
      focusNode: focusNode,
      errorText: 'error_pin_match'.tr,
      obscureText: true,
      obscuringCharacter: '*',
      defaultPinTheme: defaultPinTheme,
      showCursor: false,
      focusedPinTheme: focusedPinTheme,
      preFilledWidget: preFilledWidget,
      submittedPinTheme: submittedPinTheme,
    );
  }
}
