import 'package:flutter/material.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/default_elevated_button.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bannerBackground,
        borderRadius: BorderRadius.circular(AppDimension.height6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: AppDimension.getProportionateScreenWidth(28),
              top: AppDimension.getProportionateScreenHeight(31),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headerText,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontSize: AppDimension.font14,
                      ),
                ),
                SizedBox(height: AppDimension.height12),
                DefaultElevatedButton(
                  width: AppDimension.getProportionateScreenWidth(78),
                  height: AppDimension.getProportionateScreenHeight(35),
                  press: onPressed,
                  textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: AppDimension.font12,
                        color: AppColors.black100,
                      ),
                  buttonStyle: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellowBtn,
                  ),
                  bText: btnText,
                ),
              ],
            ),
          ),
          SizedBox(
             width: AppDimension.getProportionateScreenWidth(106),
              height: AppDimension.getProportionateScreenHeight(143),
              child: Image.asset(imgSrc)),
        ],
      ),
    );
  }
}
