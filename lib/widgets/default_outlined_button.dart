import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';

import '../constants/app_colors.dart';

class DefaultOutlinedButton extends StatelessWidget {
  const DefaultOutlinedButton({
    required this.bText,
    required this.press,
    this.bIcon,
    this.height,
    super.key, this.width, this.buttonStyle, this.textStyle,
  });
  final String bText;
  final String? bIcon;
  final void Function() press;
  final double? height, width;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width ?? double.infinity,
      height: height ?? AppDimension.getProportionateScreenHeight(52),
      child: OutlinedButton(
        onPressed: press,
        style: buttonStyle ?? OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimension.height6),
          ),
            side: BorderSide(
                width: AppDimension.getProportionateScreenWidth(1),
                color: AppColors.primary500 ),
        ),
        child: bIcon != null ?
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bText,
              style: textStyle ?? Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: AppDimension.font16,
              ),
            ),
            SizedBox(width: AppDimension.getProportionateScreenWidth(10)),
            SvgPicture.asset(bIcon!,
              width: AppDimension.height24,
              height: AppDimension.height24,
            )
            //Icon(bIcon, color: kArrowIconColor,),
          ],
        )
            : Text(
          bText,
          style: textStyle ?? Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: AppDimension.font16
          ),
        ),
      ),
    );
  }
}
