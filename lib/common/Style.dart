import 'package:fab_nhl/common/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FABStyles {
  // Style for buttons throughout the app
  static ButtonStyle appStyleButton(Color primaryColor,
      {Size? minSize, Color? highlightColor}) {
    return ElevatedButton.styleFrom(
        primary: primaryColor,
        onPrimary: highlightColor ?? Colors.white,
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
      fontSize: 16.sp,
    );
  }

// Style for header labels throughout the app
  static TextStyle appStyleHeaderText(Color color) {
    return TextStyle(
      fontSize: 28.sp,
      fontFamily: "GraphikSemibold",
      fontWeight: FontWeight.w600,
      height: 1.25,
      color: color,
    );
  }

// Style for input text
  static final TextStyle appStyleInputText = TextStyle(
      fontSize: 19.sp,
      // fontWeight: FontWeight.w500,
      color: inputTextColor,
      fontFamily: 'SF Pro Text');

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

  static final appThemeData = ThemeData(
    // primarySwatch: Colors.green,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(primary: primaryLabelColor, secondary: primaryLabelColor),
    textSelectionTheme: TextSelectionThemeData(cursorColor: primaryLabelColor),
  );
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
    return ElevatedButton(
      style: FABStyles.appStyleButton(bgColor ?? primaryLabelColor,
          minSize: minSize),
      onPressed: onPressed,
      child: Text(
        text,
        style: FABStyles.appStyleButtonText(textColor ?? Colors.white),
      ),
    );
  }

  // top bar with title and back button
  static AppBar appTopBar(
    String title, {
    bool hasCancel = false,
    Function()? backAction,
  }) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: hasCancel
          ? null
          : IconThemeData(color: primaryLabelColor, size: 25.r),
      leadingWidth: hasCancel ? 80.w : null,
      leading: hasCancel
          ? TextButton(
              onPressed: backAction,
              child: Text(
                'Cancel',
                style: TextStyle(fontFamily: 'SF Pro Text', fontSize: 15.w),
              ),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
            color: headerTextColor, fontFamily: 'SF Pro Text', fontSize: 16.sp),
      ),
    );
  }
}
