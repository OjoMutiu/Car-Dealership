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
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        height: AppDimension.getProportionateScreenHeight(145),
        decoration: BoxDecoration(
          color: AppColors.primary600,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
              EdgeInsets.only(left: AppDimension.getProportionateScreenWidth(28)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppDimension.getProportionateScreenHeight(31)),
                  Text(
                    headerText,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontSize: AppDimension.font14
                    ),
                  ),
                  SizedBox(height: AppDimension.height12),
                  DefaultElevatedButton(
                    width: AppDimension.getProportionateScreenWidth(78),
                    height: AppDimension.height28,
                      press: onPressed,
                      textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: AppDimension.font12,
                        color: AppColors.black100
                      ),
                      buttonStyle: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.yellowBtn,
                      ), bText: btnText,),
                ],
              ),
            ),
            SizedBox(width: AppDimension.getProportionateScreenWidth(56)),
            SizedBox(
                width: AppDimension.getProportionateScreenWidth(100),
                child: Image.asset(imgSrc)),
          ],
        ),
      ),
    );
  }
}