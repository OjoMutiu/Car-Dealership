import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/constant/size.dart';
import 'package:oloworay_autos/src/home/home.dart';
import 'package:oloworay_autos/src/screens/onboarding/single_button_icon.dart';

import '../../constant/row_text_button.dart';
import '../../constant/strings.dart';
import '../signup/header.dart';
import 'otp_form.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Size().getProportionateScreenHeight(20.0)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HeaderText(
            hText: oTitle,
            sText: oSubtitle,
          ),
          SizedBox(height: Size().getProportionateScreenHeight(40.0)),
          const OtpForm(),
          SizedBox(height: Size().getProportionateScreenHeight(250.0)),
          RowTextButton(
            tap: () {
              //Todo: Set the on tap function
            },
            rowText: 'Didn\'t receive any SMS? ',
            rowButton: 'Resend Code',
          ),
          SizedBox(height: Size().getProportionateScreenHeight(36.0)),
          SingleButton(
            dHeight: Size().getProportionateScreenHeight(25),
            press: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:
              (context) => const MyHomePage()
              ));
            },
            bText: bVerify,
            bIcon: forwardArrow,
          ),
        ]));
  }
}

