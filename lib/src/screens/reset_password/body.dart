import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/screens/reset_password/password_reset_successful.dart';
import 'package:oloworay_autos/src/screens/reset_password/reset_password_form.dart';


import '../../constant/strings.dart';
import '../../constant/size.dart';
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
        padding: EdgeInsets.symmetric(horizontal: Size().getProportionateScreenHeight(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderText(
              hText: rTitle,
              sText: rSubtitle,
            ),
            ResetPasswordForm(formKey: _formKey),
            Column(
              children: [
                SizedBox(height: Size().getProportionateScreenHeight(25.0)),
                SingleButton(
                    bText: bReset,
                    press: () {
                      if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PasswordResetSuccessful()));
                      }
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
