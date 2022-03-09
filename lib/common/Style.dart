import 'package:fab_nhl/common/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FABStyles {
  // Style for buttons throughout the app
  static ButtonStyle appStyleButton(Color primaryColor,
      {Size? minSize, Color? highlightColor}) {
    return ElevatedButton.styleFrom(
        primary: primaryColor,
        onPrimary: highlightColor ?? primaryColor,
        shadowColor: Colors.grey,
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
        minimumSize:
            Size(minSize?.width.w ?? 300.w, minSize?.height.h ?? 56.h));
  }

// Style for button titles throughout the app
  static TextStyle appStyleButtonText(Color color) {
    return TextStyle(
      color: color,
      fontFamily: 'SF Pro',
      fontWeight: FontWeight.w600,
      fontSize: ScreenUtil().setSp(16),
    );
  }

// Style for header labels throughout the app
  static TextStyle appStyleHeaderText(Color color) {
    return TextStyle(
      fontSize: ScreenUtil().setSp(28),
      fontFamily: "GraphikSemibold",
      fontWeight: FontWeight.w600,
      height: 1.25,
      color: color,
    );
  }

  static final TextStyle subHeaderLabelStyle = TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      color: subHeader,
      fontFamily: 'SF Pro Text');

  static final TextStyle redirectLabelStyle = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: hintLabel,
      fontFamily: 'SF Pro Text');
}

// FAB app design specific widgets
class FABWidget {
  static // Button to be used throughout the app
      Widget appButton(String text,
          {Function()? onPressed,
          Color? bgColor,
          Color? textColor,
          Size? minSize,
          Color? highlightColor}) {
    return TextButton(
      style: FABStyles.appStyleButton(bgColor ?? primaryLabelColor,
          minSize: minSize),
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      child: Text(
        text,
        style: FABStyles.appStyleButtonText(textColor ?? Colors.white),
      ),
    );
  }
}
