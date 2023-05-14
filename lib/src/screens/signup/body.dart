import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oloworay_autos/src/constant/color.dart';
import 'package:oloworay_autos/src/constant/row_text_button.dart';
import 'package:oloworay_autos/src/constant/strings.dart';
import 'package:oloworay_autos/src/constant/size.dart';
import 'package:oloworay_autos/src/screens/onboarding/single_button_icon.dart';
import 'package:oloworay_autos/src/screens/signup/sign_up_form.dart';
import 'package:oloworay_autos/src/screens/verification/otp.dart';

import 'header.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size().init(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Size().getProportionateScreenHeight(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderText(
              hText: sTitle,
              sText: sSubtitle,
            ),
            SignUpForm(formKey: _formKey),
            Column(
              children: [
                SizedBox(height: Size().getProportionateScreenHeight(20.0)),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {
                        value == true;
                      },
                      checkColor: kPrimaryColor,
                    ),
                    Text(
                      termsAndService,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: kBodyTextColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        //Todo: Navigate to terms and service page
                      },
                      child: Text(
                        termsAndServiceBtn,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Size().getProportionateScreenHeight(25.0)),
                SingleButton(
                    bText: bSignUp,
                    press: () {
                      //Todo: setup form key and state
                      // if(_formKey.currentState != null){
                      //   if(_formKey.currentState.validate()){
                      //     _formKey.currentState.save();
                      //   }
                      // }

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const OTP()));
                    }),
                SizedBox(height: Size().getProportionateScreenHeight(12.0)),
                Text('or',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: kBodyTextColor)),
                SizedBox(height: Size().getProportionateScreenHeight(12.0)),
                SizedBox(
                  width: double.infinity,
                  height: Size().getProportionateScreenHeight(56),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          width: Size().getProportionateScreenWidth(0.5),
                          color: kPrimaryColor.withOpacity(0.4)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(googleIcon),
                        SizedBox(width: Size().getProportionateScreenWidth(14)),
                        Text(
                          tGoogleLogin,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: kBodyTextColor2.withOpacity(0.8),
                                  fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Size().getProportionateScreenHeight(20.0)),
                RowTextButton(
                    tap: () {
                      //Todo: Set the on tap function
                    },
                    rowText: 'Already have an account? ',
                    rowButton: 'Login'),
                SizedBox(height: Size().getProportionateScreenHeight(70.0)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//SizedBox(height: Size().getProportionateScreenHeight(5),),
