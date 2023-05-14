import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos/src/screens/sign_in/body.dart';

import '../../constant/strings.dart';
import '../onboarding/onboarding_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
