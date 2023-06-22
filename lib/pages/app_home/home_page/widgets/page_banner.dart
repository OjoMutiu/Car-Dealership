import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/controllers/main_homepage_controller.dart';
import 'package:oloworay_autos_/pages/app_home/home_page/widgets/page_banner_item.dart';

import '../../../../constants/app_dimensions.dart';

class PageBanner extends StatelessWidget {
  const PageBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomePageController controller  = Get.find();

    return SizedBox(
      height: AppDimension.getProportionateScreenHeight(144),
      child: PageView.builder(
          pageSnapping: true,
          controller: controller.controller,
          scrollDirection: Axis.horizontal,
          itemCount: controller.pageBannerItems.length,
          itemBuilder: (BuildContext context, int index) {
            final double itemWidth = MediaQuery.of(context).size.width;
            final double itemMarginLeft = index == 0 ? (itemWidth * 0.03): 0;
            return Container(
              margin:
                  EdgeInsets.only(left: itemMarginLeft, right: AppDimension.width12),
              child: BannerItem(
                headerText: controller.pageBannerItems[index].headerText,
                btnText: controller.pageBannerItems[index].btnText,
                imgSrc: controller.pageBannerItems[index].imageUrl,
                onPressed: () {
                  switch (index) {
                    case 0:
                      //todo: navigate to the see cars page
                      break;
                    case 1:
                      //todo: navigate to the see deals page
                      break;
                  }
                },
              ),
            );
          }),
    );
  }
}
