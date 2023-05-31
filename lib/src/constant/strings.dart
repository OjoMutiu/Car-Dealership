//Splash Screen Strings
String splashScreenImage = 'assets/images/onboarding/oloworay_autos_logo.svg';

//OnBoarding Screen Strings
String onBoarding1 = 'assets/images/onboarding/onboarding1.svg';
String onBoarding2 = 'assets/images/onboarding/onboarding2.svg';
String onBoarding3 = 'assets/images/onboarding/onboarding3.svg';
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
String signUpFormUserNameHint = 'Amunega Favour $username';
String signUpFormEmailHint = 'Enter email address';
String signUpFormPasswordHint = 'Create password';
String signUpFormCPasswordHint = 'Confirm password';
String termsAndService = 'I agree to the Oloworay autos ';
String termsAndServiceBtn = 'Terms of Service';
String tGoogleLogin = 'Login with Google';

        //Icon
String backArrow = 'assets/icons/back_arrow_icon.svg';
String googleIcon = 'assets/icons/google_icon.svg';
String lockIcon = 'assets/icons/lock.svg';
String phoneIcon = 'assets/icons/handset.svg';
String emailIcon = 'assets/icons/email.svg';
String contactIcon = 'assets/icons/contact.svg';

      //Error List
final List<String> emailErrors = [];
final List<String> userNameError = [];
final List<String> phoneNumberError = [];
final List<String> passwordErrors = [];
final List<String> cPasswordErrors = [];
final List<String> tError = [];

//OtpPage
String oTitle = 'Verification';
String phoneNumber = '+234 7039378543';
String oSubtitle = 'Please enter the 4 digit code sent \n to $phoneNumber';
String bVerify = 'Verify';

//SignInPage
String siTitle = 'Let\'s sign you in';
String siSubtitle = 'Welcome back, we are glad to have you back';
String bLogin = 'Log in';
String signInFormPasswordHint ='Password';

//Forget Password Page
String fTitle = 'Forgot your password';
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
String fieldEmpty = 'Field cannot be empty';
String validEmailError = 'Please enter a valid email';
String validPhoneError = 'Please enter a valid number';
String validUserNameError = 'Please enter a valid name';
String validPasswordError = 'Password must be minimum of six characters';
String passwordConfirmMatchError = 'Password does not match';
bool isPasswordValid(String password) => password.length >= 6;
bool isEmailValid(String email) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}
bool isPhoneNumberValid(String num){
  String pattern = r'^\s*(?:\+?(\d{3}))?[ ]?(\d{3,4})(\d{3})(\d{4})(?: *x(\d+))?\s*$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(num);
}


//HomePage
String userProfilePic = 'assets/images/home_screen/user_image.png';
String bannerHeaderText1 = 'Get deals on inspected\n and used cars';
String bannerButtonText1 = 'See Cars';
String bannerImage1 = 'assets/images/home_screen/banner_car.png';
String bannerImage2 = 'assets/images/home_screen/growth_arrow.png';
String bannerHeaderText2 = 'Get 15% on your\n investment annually';
String bannerButtonText2 = 'See Deals';