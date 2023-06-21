import 'package:flutter/material.dart';
import 'package:oloworay_autos_/pages/app_home/home_page/widgets/page_banner_item.dart';

import '../../../../constants/app_strings.dart';


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

