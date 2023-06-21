import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_dimensions.dart';

class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton({
    required this.bText,
    required this.press,
    this.bIcon,
    this.height,
    super.key,
    this.width,
    this.buttonStyle,
    this.textStyle,
  });
  final String bText;
  final String? bIcon;
  final void Function() press;
  final double? height, width;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width == null
          ? double.infinity
          : AppDimension.getProportionateScreenWidth(width!),
      height: height == null
          ? AppDimension.getProportionateScreenHeight(52)
          : AppDimension.getProportionateScreenHeight(height!),
      child: ElevatedButton(
        onPressed: press,
        style: buttonStyle,
        child: bIcon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bText,
                    style: textStyle ??
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontSize: AppDimension.font16,
                            ),
                  ),
                  SizedBox(width: AppDimension.getProportionateScreenWidth(10)),
                  SvgPicture.asset(
                    bIcon!,
                    width: AppDimension.height24,
                    height: AppDimension.height24,
                  )
                  //Icon(bIcon, color: kArrowIconColor,),
                ],
              )
            : Text(
                bText,
                style: textStyle ??
                    Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontSize: AppDimension.font16,
                        ),
              ),
      ),
    );
  }
}
