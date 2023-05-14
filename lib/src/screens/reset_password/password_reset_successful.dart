import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos/src/screens/onboarding/single_button_icon.dart';
import 'package:oloworay_autos/src/screens/reset_password/reset_password.dart';
import 'package:oloworay_autos/src/screens/sign_in/sign_in.dart';

import '../../constant/strings.dart';
import '../../constant/size.dart';

class PasswordResetSuccessful extends StatelessWidget {
  const PasswordResetSuccessful({Key? key}) : super(key: key);

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
                      builder: (context) => const ResetPassword()));
            },
            icon: SvgPicture.asset(backArrow)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconCheck),
              SizedBox(height: Size().getProportionateScreenHeight(25)),
              Text(psTitle, style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: Size().getProportionateScreenHeight(2)),
              Text(
                psSubtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: Size().getProportionateScreenHeight(60)),
              SingleButton(
                  bText: bLogin,
                  press: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
