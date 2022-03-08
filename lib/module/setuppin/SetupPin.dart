import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class SetupPin extends StatefulWidget {
  final Widget pinPut;

  SetupPin(this.pinPut);

  @override
  State<SetupPin> createState() => _OtpPageState();

  @override
  String toStringShort() => pinPut.toStringShort();
}

class _OtpPageState extends State<SetupPin> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Set PIN", style: TextStyle(color: Colors.black),),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, 64, 24, 24),
        child: Column(
          children: [
            OtpHeader(),
            const SizedBox(height: 44),
            Center(child: widget.pinPut),
            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class OtpHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Set PIN',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 21.sp
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Create a memorable PIN',
          style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 14.sp
          ),
        ),
      ],
    );
  }
}
