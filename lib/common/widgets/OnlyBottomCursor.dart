import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../app_color.dart';

class OnlyBottomCursor extends StatelessWidget {
  const OnlyBottomCursor(
      {Key? key,
      required this.controller,
      required this.focusNode,
      this.length,
      this.onChange,
      this.validator})
      : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final int? length;
  final Function(String)? onChange;
  final FormFieldValidator<String>? validator;

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
      decoration: BoxDecoration(
        color: cursorColor,
        shape: BoxShape.rectangle,
        boxShadow: const [
          BoxShadow(color: cursorColor, spreadRadius: 0),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.r),
          topRight: Radius.circular(4.r),
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

    final errorPinTheme = PinTheme(
      width: 44.w,
      height: 56.h,
      textStyle: GoogleFonts.poppins(
        fontSize: 22.sp,
        color: Colors.red,
      ),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 3, color: errorColor))),
    );

    return Pinput(
      key: const Key("PinputWidget"),
      length: length ?? 4,
      pinAnimationType: PinAnimationType.slide,
      pinputAutovalidateMode: PinputAutovalidateMode.disabled,
      controller: controller,
      focusNode: focusNode,
      errorText: 'error_pin_match'.tr,
      obscureText: true,
      obscuringCharacter: '*',
      errorPinTheme: errorPinTheme,
      defaultPinTheme: defaultPinTheme,
      showCursor: false,
      focusedPinTheme: focusedPinTheme,
      preFilledWidget: preFilledWidget,
      submittedPinTheme: submittedPinTheme,
      onChanged: onChange,
      validator: validator,
    );
  }
}
