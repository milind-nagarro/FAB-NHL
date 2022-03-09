import 'package:fab_nhl/common/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Style for buttons throughout the app
ButtonStyle appStyleButton(Color primaryColor,
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
TextStyle appStyleButtonText(Color color) {
  return TextStyle(
    color: color,
    fontFamily: 'SF Pro',
    fontWeight: FontWeight.w600,
    fontSize: ScreenUtil().setSp(16),
  );
}

// Style for header labels throughout the app
TextStyle appStyleHeaderText(Color color) {
  return TextStyle(
    fontSize: ScreenUtil().setSp(28),
    fontFamily: "GraphikSemibold",
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: color,
  );
}

class FABWidget {
  static // Button to be used throughout the app
      Widget appButton(String text, Function() onPressed,
          {Color? bgColor,
          Color? textColor,
          Size? minSize,
          Color? highlightColor}) {
    return TextButton(
      style: appStyleButton(bgColor ?? primaryLabelColor, minSize: minSize),
      onPressed: () => {onPressed()},
      child: Text(
        text,
        style: appStyleButtonText(textColor ?? Colors.white),
      ),
    );
  }
}
