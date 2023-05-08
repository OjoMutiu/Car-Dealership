import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/screens/onboarding/onboarding_screen.dart';

import '../../constant/color.dart';
import 'body.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const OnBoardingPage()));
        },
          icon: const Icon(Icons.arrow_back, color: Colors.black,),

        )
      ),
      body: Body()
    ));
  }
}
