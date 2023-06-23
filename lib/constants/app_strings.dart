//Splash Screen Strings
String splashScreenImage = 'assets/images/splash/oloworay_autos_logo.svg';

//OnBoarding Screen Strings
String onBoarding1 = 'assets/images/onboarding/onBoarding1.png';
String onBoarding2 = 'assets/images/onboarding/onBoarding2.png';
String onBoarding3 = 'assets/images/onboarding/onBoarding3.png';
String onBoarding4 = 'assets/images/onboarding/onboarding4.png';
String explore = 'Explore best car deals';
String bodyTextPage1 = 'You can find all the best deals\n easily on your interest';
String bodyTextPage2 = 'Get the best audience and sell your\n car fast';
String bodyTextPage3 = 'Start your investment journey by\n creating a plan';
String bContinue = 'Continue';
String bSignUp = 'Sign up';
String bSignIn = 'Sign in';
String forwardArrow = 'assets/icons/forward_arrow_icon.svg';

//Sigup Page
//Text
String sTitle = 'Let\'s get you onboard';
String sSubtitle = 'Welcome, Register and enjoy the ride!';
String username = 'Ofu' ;
String signUpFirstName = 'Ofu';
String signUpLastName = 'Amunega';
String signUpEmail = 'example@gmail.com';
String signUpPassword = 'Create password';
String signUpCPassword = 'Confirm password';
String termsAndService = 'I agree to the Oloworay autos ';
String termsAndServiceBtn = 'Terms of Service';
String tGoogleLogin = 'Login with Google';
String bRegister = 'Register';


//Icon
String backArrow = 'assets/icons/back_arrow.svg';
String googleIcon = 'assets/icons/google_icon.svg';
String lockIcon = 'assets/icons/lock.svg';
String phoneIcon = 'assets/icons/phone.svg';
String emailIcon = 'assets/icons/email.svg';
String contactIcon = 'assets/icons/contact.svg';
String dropDownIcon = 'assets/icons/drop_down.svg';

//Error List
final List<String> tError = [];

//OtpPage
String oTitle = 'Verification';
String phoneNumberT = 'Phone number';
String oSubtitle = 'Please enter the 4 digit code sent \n to $phoneNumberT';
String bVerify = 'Verify';

//SignInPage
String siTitle = 'Let\'s sign you in';
String siSubtitle = 'Welcome back, we are glad to have you back';
String bLogin = 'Log in';
String signInFormPasswordHint ='Password';

//Forget Password Page
String fTitle = 'Forgot your password?';
String fSubtitle = 'Enter your email address here. We\'ll send you\n'
    'an email with a code to reset your password' ;
String bSubmit = 'Submit';

//Reset Password
String rTitle = 'Reset Password';
String rSubtitle = '' ;
String bReset = 'Reset password';

//Successful Login
String psTitle = 'Successful';
String psSubtitle = 'Password successfully\n updated' ;
String iconCheck = 'assets/icons/check.svg';

//Form Validator
String fieldEmpty = 'Field is required';
String validEmailError = 'Please enter a valid email';
String validPhoneError = 'Please enter a valid number';
String validUserNameError = 'Name should be at least 3 characters long';
String validPasswordError = 'Password must be minimum of six characters';
String passwordConfirmMatchError = 'Password does not match';
bool isPasswordValidB(String password) => password.length >= 8;
bool isEmailValid(String email) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}
String pattern = r'\d';
bool isPhoneNumberValidB(String num){
  String pattern = r'^\s*(?:\+?(\d{3}))?[ ]?(\d{3})(\d{3})(\d{4})(?: *x(\d+))?\s*$';
  String pattern1 = r'^\s*(?:\+?(\d{3}))?[ ]?(\d{4})(\d{3})(\d{4})(?: *x(\d+))?\s*$';
  String pattern2 = r'^\s*(?:\+?(\d{3}))[ ]?(\d{3})(\d{3})(\d{4})(?: *x(\d+))?\s*$';

  RegExp regex = RegExp(pattern);
  RegExp regex1 = RegExp(pattern1);
  RegExp regex2 = RegExp(pattern2);
  
  if(num.length == 10 && regex.hasMatch(num)){
    if(num[0].toString() == 0.toString()){
      return false;
    }
    return true;
  }
  else if(num[0].toString() == 0.toString() && regex1.hasMatch(num) && num.length == 11){
    return true;
  }else if(regex2.hasMatch(num)){
    return true;
  }
  return false;
}


//HomePage
String userProfilePic = 'assets/images/home/user_image.png';
String bannerHeaderText1 = 'Get deals on inspected\n and used cars';
String bannerButtonText1 = 'See Cars';
String bannerImage1 = 'assets/images/home/banner_car.png';
String bannerImage2 = 'assets/images/home/growth_arrow.png';
String bannerHeaderText2 = 'Get 15% on your\n investment annually';
String bannerButtonText2 = 'See Deals';

//Home Icons
String ratingIcon = 'assets/icons/rating.svg';