import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos/src/constant/size.dart';
import 'package:oloworay_autos/src/screens/forgot_password/forgot_password.dart';
import 'package:oloworay_autos/src/screens/sign_in/sign_in_form.dart';
import 'package:oloworay_autos/src/screens/signup/sign_up.dart';

import '../../constant/color.dart';
import '../../constant/row_text_button.dart';
import '../../constant/strings.dart';
import '../onboarding/single_button_icon.dart';
import '../signup/header.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Size().getProportionateScreenHeight(20.0)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeaderText(hText: siTitle, sText: siSubtitle),
            SignInForm(formKey: _formKey),
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
                    Text('Remember me', style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: kBodyTextColor)),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:
                        (context) => const ForgotPassword()));
                      },
                      child: Text('Forgot Password?',style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: kPrimaryColor)),
                    ),
                  ],
                ),
                SizedBox(height: Size().getProportionateScreenHeight(25.0)),
                SingleButton(
                    bText: bLogin,
                    press: () {
                      //Todo: setup form key and state
                      // if(_formKey.currentState != null){
                      //   if(_formKey.currentState.validate()){
                      //     _formKey.currentState.save();
                      //   }
                      // }
                      //Todo: Navigate user to correct page
                    }),
                SizedBox(height: Size().getProportionateScreenHeight(12.0)),
                Text('or', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: kBodyTextColor
                ),),
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:
                      (context) => const SignUpPage()
                      ));
                    },
                    rowText: 'Don\'t have an account? ',
                    rowButton: 'Register'),
                SizedBox(height: Size().getProportionateScreenHeight(70.0)),
              ],
            )
          ])),
    );
  }
}
