import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/constants/app_routes.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';

class UserSignUpFormController extends GetxController {
  //field text
  var count = 0.obs;
  RxString firstName = ''.obs;
  var lastName = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var password = ''.obs;
  var cPassword = ''.obs;

  //Phone Number code picker
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  var selectedCountryCode = '+234'.obs;
  BuildContext? context = Get.context;

  onTap() async {
    final code = await countryPicker.showPicker(context: context!);
      selectedCountryCode.value = code!.dialCode;
  }

  //text field icon color changing
  var prefixIconColor = AppColors.black80.obs;
  FocusNode focusNode = FocusNode();

  //Validation flags
  final RxBool isFirstNameValid = false.obs;
  final RxBool isLastNameValid = false.obs;
  final RxBool isUserEmailValid = false.obs;
  final RxBool isPhoneNumberValid = false.obs;
  final RxBool isPasswordValid = false.obs;
  final RxBool isFormValid = false.obs;

  //checkBox
  RxBool agree = false.obs;

  //Error list
  RxList firstNameError = [].obs;
  var lastNameError = [].obs;
  RxList emailErrors = [].obs;
  RxList phoneNumberError = [].obs;
  RxList passwordErrors = [].obs;
  RxList cPasswordErrors = [].obs;
  RxList tError = [].obs;


  //Instantiation of TextEditingControllers
  final TextEditingController userFirstNameController = TextEditingController();
  final TextEditingController userLastNameController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();



  //CheckBox
  void checkCheckBox() => agree.value = !agree.value;

  //LastName validation
  validateLastName(String? value) {
    lastNameError.clear();
    lastName.value = value!.trim();
    if (lastName.value.isEmpty) {
      if (!lastNameError.contains(fieldEmpty)) {
        lastNameError.add(fieldEmpty);
      }
    } else if (lastName.value.length < 3) {
      if (!lastNameError.contains(validUserNameError)) {
        lastNameError.add(validUserNameError);
      }
    }

    isLastNameValid.value = lastNameError.isEmpty;
  }

  //FirstName Validation
  validateFirstName(String? value) {
    firstNameError.clear();
    firstName.value = value!.trim();
    if (firstName.value.isEmpty) {
      if (!firstNameError.contains(fieldEmpty)) {
        firstNameError.add(fieldEmpty);
      }
    } else if (firstName.value.length < 3) {
      if (!firstNameError.contains(validUserNameError)) {
        firstNameError.add(validUserNameError);
      }
    }

    isFirstNameValid.value = firstNameError.isEmpty;
  }

  //Email Validation
  validateEmail(String? value) {
    emailErrors.clear();
    if (value != null) {
      email.value = value;
      if (email.value.isEmpty) {
        if (!emailErrors.contains(fieldEmpty)) {
          emailErrors.add(fieldEmpty);
        }
      } else if (!isEmailValid(email.value)) {
        if (!emailErrors.contains(validEmailError)) {
          emailErrors.add(validEmailError);
        }
      }
    }

    isUserEmailValid.value = emailErrors.isEmpty;
  }

  //Phone number validation
  validatePhoneNumber(String? value) {
    phoneNumberError.clear();
    if (value != null) {
      phoneNumber.value = value.trim();
      if (phoneNumber.value.isEmpty) {
        if (!phoneNumberError.contains(fieldEmpty)) {
          phoneNumberError.add(fieldEmpty);
        }
      } else if (!isPhoneNumberValidB(phoneNumber.value)) {
        if (!phoneNumberError.contains(validPhoneError)) {
          phoneNumberError.add(validPhoneError);
        }
      }
    }
    isPhoneNumberValid.value = phoneNumberError.isEmpty;
  }

  //Password Validation
  validatePassword(String? value) {
    passwordErrors.clear();
    if (value != null) {
      password.value = value;
      if (!isPasswordValidB(password.value)) {
        if (!passwordErrors.contains(validPasswordError)) {
          passwordErrors.add('8 character');
          //Todo: If you want to change text color,
          // create a reactive color hear and apply in passError class
        }
      }
      if (!GetUtils.hasCapitalletter(password.value)) {
        if (!passwordErrors.contains(validPasswordError)) {
          passwordErrors.add('Uppercase');
        }
      }
      if (!GetUtils.hasMatch(password.value, r'\d')) {
        if (!passwordErrors.contains(validPasswordError)) {
          passwordErrors.add('Numeric');
        }
      }
      if (!GetUtils.hasMatch(password.value, r'[!@#$%^&*(),.?":{}|<>]')) {
        if (!passwordErrors.contains(validPasswordError)) {
          passwordErrors.add('Symbols');
        }
      }
      if (password.value.isNotEmpty) {
        //passwordErrors.remove(fieldEmpty);
      }
      if (isPasswordValidB(password.value)) {
        if (passwordErrors.contains(validPasswordError)) {
          // passwordErrors.remove(validPasswordError);
        }
      }
    }

    isPasswordValid.value = passwordErrors.isEmpty;
  }

  //FormValidation
  void submitSignUpForm() {
    isFormValid.value = isFirstNameValid.value &&
        isUserEmailValid.value &&
        isLastNameValid.value &&
        isPhoneNumberValid.value &&
        isPasswordValid.value;

    if (isFormValid.value) {
      if (agree.value) {
        Get.toNamed(Routes.otp);
      } else {
        Get.snackbar('','Agree to Terms of Service to continue',
            colorText: AppColors.primary600,
            backgroundColor: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(milliseconds: 2000));
      }
    } else if (!isFormValid.value) {
      if (!isFirstNameValid.value) {
        validateFirstName(firstName.value);
      }
      if(!isPasswordValid.value){
        validatePassword(password.value);
      }
      if (!isLastNameValid.value) {
        validateLastName(lastName.value);
      }
      if (!isUserEmailValid.value) {
        validateEmail(email.value);
      }
      if (!isPhoneNumberValid.value) {
        validatePhoneNumber(phoneNumber.value);
      }
    } else {
      validateEmail(email.value);
    }
  }
}
