import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oloworay_autos/src/constant/strings.dart';
import 'package:oloworay_autos/src/constant/size.dart';

import '../../constant/color.dart';
import '../signup/sign_up.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class OnBoardingContent{
  late String headText, text, image;
  OnBoardingContent({required this.headText, required this.text, required this.image});
}
int currentPage = 0;
late PageController controller;
List<OnBoardingContent> content = [
  OnBoardingContent(headText: explore, text: bodyTextPage1, image: onBoarding1),
  OnBoardingContent(headText: explore, text: bodyTextPage2, image: onBoarding2),
  OnBoardingContent(headText: explore, text: bodyTextPage3, image: onBoarding3),
];

class _OnBoardingPageState extends State<OnBoardingPage> {

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: Size().getProportionateScreenHeight(16)),
            Row(
              children: [
                SizedBox(width: Size().getProportionateScreenWidth(315)),
                TextButton(
                    onPressed: (){
                      if(currentPage==content.length-1){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const SignUpPage()));
                      }
                      controller.nextPage(duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceIn);
                    },
                    child: Text('Skip', style: Theme.of(context).textTheme.bodyLarge,)),
              ],
            ),
            Expanded(
              child:
              PageView.builder(
                controller: controller,
                  itemCount: content.length,
                  onPageChanged: (int index){
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index){
                    //index = 2;
                    return SplashContent(
                      headText: content[index].headText,
                      text: content[index].text,
                      image: content[index].image);
                  }),
            ),
            SizedBox(height: Size().getProportionateScreenHeight(12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(content.length, (index) => buildDot(index: index)),
            ),
            Container(
                child: currentPage == content.length -1? const DoubleButton():const SingleButton()),
            SizedBox(height: Size().getProportionateScreenHeight(38)),
          ],
        ),
      ),
    );
  }

  Container buildDot({required int index}) {
    return Container(
                margin: EdgeInsets.only(right: Size().getProportionateScreenWidth(5)),
                height: Size().getProportionateScreenHeight(3),
                width: currentPage == index? Size().getProportionateScreenHeight(24):
                Size().getProportionateScreenHeight(12),
                decoration: BoxDecoration(
                  color: currentPage==index? kPrimaryColor: const Color(0xFF282828).withOpacity(0.28),
                  borderRadius: BorderRadius.circular(1.0),
                ),
              );
  }
}

class SingleButton extends StatelessWidget {
  const SingleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Size().getProportionateScreenHeight(100)),
        SizedBox(
          width: Size().getProportionateScreenWidth(327),
          height: Size().getProportionateScreenHeight(56),
          child: ElevatedButton(
            onPressed: (){
              controller.nextPage(duration: const Duration(milliseconds: 200),
                  curve: Curves.bounceIn);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Continue', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),),
                SizedBox(width: Size().getProportionateScreenWidth(10)),
                const Icon(Icons.arrow_forward, color: kArrowIconColor,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DoubleButton extends StatelessWidget {
  const DoubleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Size().getProportionateScreenHeight(38)),
        SizedBox(
          width: Size().getProportionateScreenWidth(327),
          height: Size().getProportionateScreenHeight(56),
          child: ElevatedButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
            },
            child: Text('Sign up', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),),
          ),
        ),
        SizedBox(height: Size().getProportionateScreenHeight(16)),
        SizedBox(
          width: Size().getProportionateScreenWidth(327),
          height: Size().getProportionateScreenHeight(56),
          child: OutlinedButton( onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
          },
            style: OutlinedButton.styleFrom(
              side:BorderSide(width: Size().getProportionateScreenWidth(1), color: kPrimaryColor) ,
            ),
            child: Text('Sign in', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: kPrimaryColor,
              fontWeight: FontWeight.normal,
            ),),
          ),
        ),
      ],
    );
  }
}

class SplashContent extends StatefulWidget {
  const SplashContent({
    super.key, required this.headText, required this.text, required this.image,
  });
  final String headText, text, image;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Size().getProportionateScreenHeight(20)),
        SvgPicture.asset(widget.image, ),
        SizedBox(height: Size().getProportionateScreenHeight(30)),
        Text(widget.headText, style: Theme.of(context).textTheme.headlineLarge),
        SizedBox(height: Size().getProportionateScreenHeight(10)),
        Text(widget.text, textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
