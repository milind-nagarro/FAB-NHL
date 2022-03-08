import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OnlyBottomCursor extends StatefulWidget {
  @override
  _OnlyBottomCursorState createState() => _OnlyBottomCursorState();

  @override
  String toStringShort() => 'With Bottom Cursor';
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
    const borderColor = Color.fromRGBO(25, 103, 253, 1);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(),
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: borderColor,
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.black26,
          ),
        ),
      ],
    );

    return Pinput(
      length: 4,
      pinAnimationType: PinAnimationType.slide,
      controller: controller,
      focusNode: focusNode,
      obscureText: true,
      obscuringCharacter: '*',
      defaultPinTheme: defaultPinTheme,
      showCursor: true,
      cursor: cursor,
      preFilledWidget: preFilledWidget,
    );
  }
}