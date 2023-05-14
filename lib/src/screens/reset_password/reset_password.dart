import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos/src/screens/forgot_password/forgot_password.dart';
import 'package:oloworay_autos/src/screens/reset_password/body.dart';

import '../../constant/strings.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassword()));
                  },
                  icon: SvgPicture.asset(backArrow))),
          body: const Body(),
    ));
  }
}
