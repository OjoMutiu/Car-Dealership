import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/size.dart';


class CarTag extends StatelessWidget {
  const CarTag({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Size().getProportionateScreenWidth(4)),
      child: Container(
        height: 20,
        padding: EdgeInsets.symmetric(
            horizontal: Size().getProportionateScreenWidth(8),
            vertical: Size().getProportionateScreenHeight(4)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Size().getProportionateScreenWidth(4)),
            color: kPrimaryColor.withOpacity(0.15)),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(
              color: kPrimaryColor, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}