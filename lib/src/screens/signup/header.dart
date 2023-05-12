import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/constant/size.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key, required this.hText, required this.sText,
  });
  final String hText, sText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Size().getProportionateScreenHeight(25),),
        Text(hText, style: Theme.of(context).textTheme.headlineLarge,),
        Text(sText, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400
        ),)
      ],
    );
  }
}