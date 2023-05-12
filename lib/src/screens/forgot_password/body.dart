import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/screens/sign_in/sign_in.dart';

import '../../constant/row_text_button.dart';
import '../../constant/strings.dart';
import '../../constant/size.dart';
import '../onboarding/single_button_icon.dart';
import '../signup/header.dart';
import 'forget_password_form.dart';


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
            HeaderText(hText: fTitle, sText: fSubtitle),
            SizedBox(height: Size().getProportionateScreenHeight(50.0)),
            ForgetPasswordForm(formKey: _formKey),
            Column(
              children: [
                SizedBox(height: Size().getProportionateScreenHeight(25.0)),
                SingleButton(
                    bText: bSubmit,
                    press: () {
                      //Todo: setup form key and state
                      // if(_formKey.currentState != null){
                      //   if(_formKey.currentState.validate()){
                      //     _formKey.currentState.save();
                      //   }
                      // }
                      //Todo: Navigate user to correct page
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const OTP()));
                    }),
                SizedBox(height: Size().getProportionateScreenHeight(20.0)),
                RowTextButton(
                    tap: () {
                      //Todo: Set the on tap function
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:
                          (context) => const SignInPage()
                      ));
                    },
                    rowText: 'Back to ',
                    rowButton: 'Login'),
                SizedBox(height: Size().getProportionateScreenHeight(70.0)),
              ],
            )
          ])),
    );
  }
}