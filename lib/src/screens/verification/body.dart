import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/constant/size.dart';
import 'package:oloworay_autos/src/screens/onboarding/single_button_icon.dart';

import '../../constant/row_text_button.dart';
import '../../constant/strings.dart';
import '../home/home.dart';
import 'otp_form.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({
    super.key,
    required this.userPhoneNumber, required this.userName,
  });

  final String userPhoneNumber;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Size().getProportionateScreenHeight(20.0)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Size().getProportionateScreenHeight(25),),
              Text(oTitle, style: Theme.of(context).textTheme.headlineLarge,),
              Text('Please enter the 4 digit code sent\n to $userPhoneNumber', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400
              ),)
            ],
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
                  (context) => MyHomeScreen(userName: userName,)
              ));
            },
            bText: bVerify,
            bIcon: forwardArrow,
          ),
        ]));
  }
}
