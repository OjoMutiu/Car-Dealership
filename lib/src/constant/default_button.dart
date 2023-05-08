import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/constant/size.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key, required this.width, required this.height, required this.press, required this.text,
  });
  final double width, height;
  final void Function() press;
  final String text;
  @override
  Widget build(BuildContext context) {
    Size().init(context);
    return SizedBox(
      width: Size().getProportionateScreenWidth(width),
      height: Size().getProportionateScreenHeight(height),
      child: ElevatedButton(
        onPressed: press,
        child: Text(text, style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.normal,)),
      ),
    );
  }
}