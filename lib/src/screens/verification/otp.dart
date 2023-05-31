import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../constant/strings.dart';
import '../signup/sign_up.dart';
import 'body.dart';

class OTP extends StatelessWidget {
  const OTP({Key? key, required this.userPhoneNumber, required this.userName}) : super(key: key);
  final String userPhoneNumber;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()));
            },
              icon: SvgPicture.asset(backArrow), //, colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),)
            )
        ),
        body: OtpBody(userPhoneNumber: userPhoneNumber, userName: userName,),//const OtpBody(),
    ));
  }
}
