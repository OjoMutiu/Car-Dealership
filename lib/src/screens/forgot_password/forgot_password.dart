import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos/src/screens/forgot_password/body.dart';
import 'package:oloworay_autos/src/screens/sign_in/sign_in.dart';

import '../../constant/strings.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SignInPage()));
            },
              icon: SvgPicture.asset(backArrow), //, colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),)
            )
        ),
      body: const Body(),
    ));
  }
}
