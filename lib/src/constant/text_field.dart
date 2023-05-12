import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class TextFieldWidget extends StatelessWidget {
   TextFieldWidget({
    super.key,
    required this.hintText,
    required this.svgIcon,
    required this.textInputType,
    this.obscure, this.suffix, this.validator,
  });
  final String hintText, svgIcon;
  final TextInputType textInputType;
  final bool? obscure;
  final Widget? suffix;
  final String Function(String value)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure!,
      keyboardType: textInputType,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 12
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(svgIcon,
              colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),),
          ),
        suffixIcon: suffix,
      ),
    );
  }
}