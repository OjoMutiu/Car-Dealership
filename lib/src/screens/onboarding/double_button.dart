import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/constant/size.dart';
import 'package:oloworay_autos/src/constant/strings.dart';
import 'package:oloworay_autos/src/screens/onboarding/single_button_icon.dart';
import 'package:oloworay_autos/src/screens/sign_in/sign_in.dart';

import '../../constant/color.dart';
import '../signup/sign_up.dart';

class DoubleButton extends StatelessWidget {
  const DoubleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size().init(context);
    return Column(
      children: [
        SizedBox(height: Size().getProportionateScreenHeight(38)),
        SingleButton(
          bText: bSignUp,
          press: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SignUpPage()));
          },
        ),
        SizedBox(height: Size().getProportionateScreenHeight(16)),
        SizedBox(
          width: double.infinity,
          height: Size().getProportionateScreenHeight(56),
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SignInPage()));
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                  width: Size().getProportionateScreenWidth(1),
                  color: kPrimaryColor),
            ),
            child: Text(
              'Sign in',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}