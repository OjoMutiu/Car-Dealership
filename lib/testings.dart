import 'package:flutter/material.dart';

import 'package:oloworay_autos/src/constant/color.dart';
import 'package:oloworay_autos/src/constant/form_error.dart';

import 'package:oloworay_autos/src/constant/size.dart';
import 'package:oloworay_autos/src/constant/strings.dart';
import 'package:oloworay_autos/src/constant/text_field.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final formKey1 = GlobalKey<FormState>();
  final List<String> emailErrors = [];
  final List<String> passwordErrors = [];
  final List<String> agreeError = ['Please accept terms and conditions'];
  late String userEmail;
  late String userPassword;
  bool show = false;
  bool showErrorMessage = false;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Size().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Testing',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(
                key: formKey1,
                child: Column(
                  children: [
                    buildTextFormField(
                      context,
                      show: false,
                      hintText: 'Enter email address',
                      svgIcon: 'assets/icons/email.svg',
                      onSaved: (newValue) => userEmail = newValue!,
                      validator: (value) {
                        if ((value == null || value.isEmpty)) {
                          //Todo: create a custom error message
                          if (!emailErrors.contains('Field is empty')) {
                            setState(() {
                              emailErrors.add('Field is empty');
                            });
                          }
                          return '';
                        } else if (!isEmailValid(value)) {
                          if (!emailErrors
                              .contains('Please enter a valid email')) {
                            setState(() {
                              emailErrors.add('Please enter a valid email');
                            });
                          }
                          return '';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            emailErrors.remove('Field is empty');
                          });
                        }
                        if (isEmailValid(value)) {
                          setState(() {
                            emailErrors.remove('Please enter a valid email');
                          });
                        }
                      }, textInputType: TextInputType.emailAddress,
                    ),
                    Column(
                        children: List.generate(
                      emailErrors.length,
                      (index) => buildErrorMessage(context,
                          errorMessage: emailErrors[index]),
                    )),
                    buildTextFormField(
                      context,
                      show: true,
                      hintText: 'Create Password',
                      svgIcon: 'assets/icons/lock.svg',
                      onSaved: (newValue) => userPassword = newValue!,
                      validator: (value) {
                        if ((value == null || value.isEmpty)) {
                          //Todo: create a custom error message
                          if (!passwordErrors.contains('Field is empty')) {
                            setState(() {
                              passwordErrors.add('Field is empty');
                            });
                          }
                          return '';
                        } else if (!isPasswordValid(value)) {
                          if (!passwordErrors
                              .contains('Please enter a valid password')) {
                            setState(() {
                              passwordErrors.add('Please enter a valid password');
                            });
                          }
                          return '';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            passwordErrors.remove('Field is empty');
                          });
                        }
                        if (isPasswordValid(value)) {
                          if(passwordErrors.contains('Please enter a valid password')){
                            setState(() {
                              passwordErrors.remove('Please enter a valid password');
                            });
                          }
                        }
                      }, textInputType: TextInputType.visiblePassword,
                    ),
                    FormError(errors: passwordErrors),
                    // Column(
                    //     children: List.generate(
                    //       passwordErrors.length,
                    //           (index) => buildErrorMessage(context,
                    //           errorMessage: passwordErrors[index]),
                    //     )),
                  ],
                ),
              ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CheckboxListTile(
                  title: const Text('I agree to the terms and conditions'),
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                if (showErrorMessage)
                  FormError(errors: agreeError),
                ElevatedButton(
                  onPressed: () {
                    if(!isChecked){
                      setState(() {
                        showErrorMessage = true;
                      });
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey1.currentState!.validate()) {
                        // Code to execute if the condition is true
                        //formKey1.currentState!.save(),

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MaterialApp(
                                      home: Scaffold(
                                        appBar: AppBar(
                                          title: const Text('NextPage'),
                                        ),
                                      ),
                                    )));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  // TextFormField buildTextFormField(
  //   BuildContext context, {
  //   required String? Function(String? value) validator,
  //   required void Function(String value) onChanged,
  //   required void Function(String? value) onSaved,
  //       required String hintText,
  //       String? svgIcon,
  //       Widget? suffix,
  //       bool? show,
  // })
  // {
  //   return svgIcon!=null ? TextFormField(
  //     onSaved: onSaved,
  //     validator: validator,
  //     onChanged: onChanged,
  //     keyboardType: TextInputType.visiblePassword,
  //     cursorColor: Colors.black,
  //     decoration: InputDecoration(
  //       hintText: hintText,
  //       hintStyle:
  //           Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
  //       prefixIcon: Padding(
  //         padding: const EdgeInsets.all(10.0),
  //         child: SvgPicture.asset( svgIcon,
  //           // colorFilter:
  //           //     const ColorFilter.mode(Colors.black, BlendMode.srcIn),
  //         ),
  //       ),
  //       suffixIcon: suffix,
  //     ),
  //     obscureText: show!,
  //   ) : TextFormField(
  //     onSaved: onSaved,
  //     validator: validator,
  //     onChanged: onChanged,
  //     keyboardType: TextInputType.visiblePassword,
  //     cursorColor: Colors.black,
  //     decoration: InputDecoration(
  //       hintText: hintText,
  //       hintStyle:
  //       Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
  //       suffixIcon: suffix,
  //     ),
  //     obscureText: show!,
  //   );
  // }

  // void onChanged(value) {
  //   if (value.isNotEmpty) {
  //     setState(() {
  //       emailErrors.remove('Field is empty');
  //     });
  //   } else if (isEmailValid(value)) {
  //     setState(() {
  //       emailErrors.add('Please enter a valid email');
  //     });
  //   }
  // }

  // String? validator(value){
  //                       if ((value == null || value.isEmpty)) {
  //                         //Todo: create a custom error message
  //                         if(!emailErrors.contains('Field is empty')){
  //                           setState(() {
  //                             emailErrors.add('Field is empty');
  //                           });
  //                         }
  //                         return '';
  //                       }
  //                       else if(!isEmailValid(value)){
  //                         if(!emailErrors.contains('Please enter a valid email')){
  //                           setState(() {
  //                             emailErrors.add('Please enter a valid email');
  //                           });
  //                         }
  //                         return '';
  //                       }
  //                       return null;
  //                     }

  // void onSaved(newValue) => userEmail = newValue!;

  Row buildErrorMessage(BuildContext context, {required String errorMessage}) {
    return Row(
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.redAccent,
          size: Size().getProportionateScreenHeight(14),
        ),
        SizedBox(width: Size().getProportionateScreenWidth(10)),
        Text(
          errorMessage,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: kBodyTextColor),
        ),
      ],
    );
  }
}

// class Suffix extends StatelessWidget {
//   const Suffix({
//     super.key,
//     this.press,
//   });
//
//   final void Function()? press;
//   // void press() {}
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: press,
//       child: Text(
//         'show',
//         style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
//       ),
//     );
//   }
//}
