import 'package:fab_nhl/common/AppColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.blue,
  padding: EdgeInsets.symmetric(vertical: 18.h),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(28)),
  ),
);

final ButtonStyle blueButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.blue),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16.h)),
    textStyle: MaterialStateProperty.all(
        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(28.0.r),
    )));

// Style for buttons throughout the app
ButtonStyle appBtnStyle(Color primaryColor,
    {Size? minSize, Color? highlightColor}) {
  return ElevatedButton.styleFrom(
      primary: primaryColor,
      onPrimary: highlightColor ?? primaryColor,
      shadowColor: Colors.grey,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
      minimumSize: Size(minSize?.width.w ?? 300.w, minSize?.height.h ?? 56.h));
}

// Style for button titles throughout the app
TextStyle btnTitleStyle(Color color) {
  return TextStyle(
    color: color,
    fontFamily: 'SF Pro',
    fontWeight: FontWeight.w600,
    fontSize: ScreenUtil().setSp(16),
  );
}
