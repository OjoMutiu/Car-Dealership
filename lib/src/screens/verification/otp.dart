import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos/src/screens/verification/body.dart';

import '../../constant/strings.dart';
import '../signup/sign_up.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
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
        body: const OtpBody(),
    ));
  }
}
