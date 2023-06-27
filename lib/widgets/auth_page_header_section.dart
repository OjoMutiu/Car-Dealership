import 'package:flutter/material.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key, required this.hText, required this.sText,
  });
  final String hText, sText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppDimension.getProportionateScreenHeight(20),),
        Text(hText, style: Theme.of(context).textTheme.headlineLarge?.copyWith(
          color: AppColors.text,
          fontSize: AppDimension.font20
        ),),
        Text(sText, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: AppDimension.font14
        ))
      ],
    );
  }
}