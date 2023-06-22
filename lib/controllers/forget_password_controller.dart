import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_routes.dart';
import '../constants/app_strings.dart';


class ForgetPasswordController extends GetxController{
  //field text
  var email = ''.obs;


  //Validation flags
  final RxBool isUserEmailValid = false.obs;
  final RxBool isFormValid = false.obs;


  //Error list
  RxList emailErrors = [].obs;

  //Instantiation of TextEditingControllers
  final TextEditingController userEmailController = TextEditingController();


  //Email Validation
  validateEmail(String? value) {
    emailErrors.clear();
    if (value != null) {
      email.value = value;
      if (email.value.isEmpty) {
        if (!emailErrors.contains(fieldEmpty)) {
          emailErrors.add(fieldEmpty);
        }
      } else if (!GetUtils.isEmail(email.value)) { //GetUtils library has a lot of nice datatype actions
        if (!emailErrors.contains(validEmailError)) {
          emailErrors.add(validEmailError);
        }
      }
    }
    isUserEmailValid.value = emailErrors.isEmpty;
  }


  //FormValidation
  void submitForgotPasswordForm() {
    isFormValid.value = isUserEmailValid.value;
    if (isFormValid.value) {
      Get.toNamed(Routes.forgetPasswordOtp);
    } else if (!isFormValid.value) {
      if (!isUserEmailValid.value) {
        validateEmail(email.value);
      }
    } else {
      validateEmail(email.value);
    }
  }
}