import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/constant/size.dart';

import '../../constant/strings.dart';
import '../../constant/text_field.dart';
import 'form_error.dart';



class SignUpForm extends StatefulWidget {
   const SignUpForm({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    final List<String> userErrors = ['Demo'];
    final List<String> useErrors = ['Demo'];
    return Form(
        key: widget._formKey,
        child: Column(
          children: [
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            TextFieldWidget(
              validator: (value){
                print(value);
                if(value.isEmpty){
                  setState(() {
                    userErrors.add('Please enter a valid name');
                  });
                }
                return '';
              },
              obscure: false,
              hintText: signUpFormUserNameHint,
              svgIcon: 'assets/icons/contact.svg',
              textInputType: TextInputType.name,
            ),
            FormError(errors: useErrors),
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            TextFieldWidget(
              obscure: false,
              hintText: signUpFormEmailHint,
              svgIcon: 'assets/icons/email.svg',
              textInputType: TextInputType.emailAddress,
            ),
            FormError(errors: userErrors),
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            TextFieldWidget(
              obscure: false,
              hintText: 'Enter phone number',
              svgIcon: 'assets/icons/handset.svg',
              textInputType: TextInputType.phone,
            ),
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            TextFieldWidget(
              hintText: signUpFormPasswordHint,
              svgIcon: 'assets/icons/lock.svg',
              textInputType: TextInputType.visiblePassword,
              suffix: TextButton(
                onPressed: () {
                  //show == true;
                },
                child: Text(
                  'show',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 12),
                ),
              ),
              obscure: false,
            ),
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            TextFieldWidget(
              obscure: true,
              hintText: signUpFormCPasswordHint,
              svgIcon: 'assets/icons/lock.svg',
              textInputType: TextInputType.visiblePassword,
              suffix: TextButton(
                onPressed: () {},
                child: Text(
                  'show',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ));
  }
}