import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/constant/size.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key, this.width, required this.height, required this.press, required this.text, required this.textStyle, required this.btnStyle,
  });
  final double? width;
  final double height;
  final void Function() press;
  final String text;
  final TextStyle? textStyle;
  final ButtonStyle btnStyle;
  @override
  Widget build(BuildContext context) {
    Size().init(context);
    return width !=null ? SizedBox(
      width: Size().getProportionateScreenWidth(width!),
      height: Size().getProportionateScreenHeight(height),
      child: ElevatedButton(
        onPressed: press,
        style: btnStyle,
        child: Text(text, style: textStyle),
      ),
    ): SizedBox(
      height: Size().getProportionateScreenHeight(height),
      child: ElevatedButton(
        onPressed: press,
        style: btnStyle,
        child: Text(text, style: textStyle),
      ),
    );
  }
}