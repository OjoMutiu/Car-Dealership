import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oloworay_autos/src/constant/default_button.dart';

import '../../constant/color.dart';
import '../../constant/size.dart';
import '../../constant/strings.dart';

class PageBanner extends StatelessWidget {
  const PageBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> banner = [
      {
        "image": bannerImage1,
        "headerText": bannerHeaderText1,
        "buttonText": bannerButtonText1
      },
      {
        "image": bannerImage2,
        "headerText": bannerHeaderText2,
        "buttonText": bannerButtonText2
      }
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
              banner.length,
              (index) => BannerItem(
                    headerText: banner[index]["headerText"],
                    btnText: banner[index]["buttonText"],
                    imgSrc: banner[index]["image"],
                    onPressed: () {
                      switch(index){
                        case 0:
                          //todo: navigate to the see cars page
                          break;
                        case 1:
                          //todo: navigate to the see deals page
                          break;
                      }
                    },
                  )),
        ],
      ),
    );
  }
}

class BannerItem extends StatelessWidget {
  const BannerItem({
    super.key,
    required this.headerText,
    required this.btnText,
    required this.imgSrc,
    required this.onPressed,
  });

  final String headerText;
  final String btnText;
  final String imgSrc;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        height: Size().getProportionateScreenHeight(145),
        decoration: BoxDecoration(
          color: kHeadLineTextColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: Size().getProportionateScreenWidth(28)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Size().getProportionateScreenHeight(31)),
                  Text(
                    headerText,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(height: Size().getProportionateScreenHeight(12)),
                  DefaultButton(height: 28,
                      press: onPressed, text: btnText,
                      textStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      btnStyle: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFC107),
                      )),
                ],
              ),
            ),
            SizedBox(width: Size().getProportionateScreenWidth(56)),
            SizedBox(
              width: Size().getProportionateScreenWidth(100),
                child: Image.asset(imgSrc)),
          ],
        ),
      ),
    );
  }
}
