import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'AppColor.dart';

final ButtonStyle activeButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: activeButtonColor,
  padding: EdgeInsets.symmetric(vertical: 18.h),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(28.0.r),
  ),
);

final TextStyle activeButtonTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'SF Pro Text',
    fontSize: 16.sp,
    fontWeight: FontWeight.w600);
