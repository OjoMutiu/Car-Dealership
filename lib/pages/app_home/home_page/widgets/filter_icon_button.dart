import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';

import '../../filter/filter_page.dart';


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
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=> const FilterPage())
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset('assets/icons/filter.svg'),
        ),
      ),
    );
  }
}