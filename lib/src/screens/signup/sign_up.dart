import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos/src/constant/strings.dart';
import 'package:oloworay_autos/src/screens/onboarding/onboarding_screen.dart';

import 'body.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                              builder: (context) => const OnBoardingPage()));
                    },
                    icon: SvgPicture.asset(backArrow))),
            body: const Body()));
  }
}
