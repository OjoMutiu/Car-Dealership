import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oloworay_autos/src/constant/strings.dart';
import 'package:oloworay_autos/src/constant/size.dart';

import '../onboarding/onboarding_screen.dart';

class MySplashscreen extends StatefulWidget {
  const MySplashscreen({Key? key}) : super(key: key);

  @override
  State<MySplashscreen> createState() => _MySplashscreenState();
}

class _MySplashscreenState extends State<MySplashscreen> {
  @override
  Widget build(BuildContext context) {
    Size().init(context);
    return SafeArea(child:
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Size().getProportionateScreenHeight(288)),
              Center(child: SvgPicture.asset(splashScreenImage)),
              SizedBox(height: Size().getProportionateScreenHeight(323)),
                Text('Version 1.0.0', style: Theme.of(context).textTheme.bodySmall),
              //Image.asset('ass'),
            ],
          ),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _navigateToOnBoardingPage();
  }
  _navigateToOnBoardingPage() async{
    await Future.delayed(const Duration(milliseconds: 2000), (){});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => OnBoardingPage()));
  }
}

