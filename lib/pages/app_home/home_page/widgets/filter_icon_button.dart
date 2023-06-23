import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';



class FilterIconButton extends StatelessWidget {
  const FilterIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimension.getProportionateScreenWidth(44),
      height: AppDimension.height52,
      decoration: BoxDecoration(
        color: AppColors.primary500,
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: (){
          Get.toNamed('/filterPage'); //Todo: add to route
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimension.width12,
              vertical: AppDimension.height15
          ),
          child: SvgPicture.asset('assets/icons/filter.svg',
            width: AppDimension.width20,
            height: AppDimension.height20,),
        ),
      ),
    );
  }
}