import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

TextFormField buildTextFormField(
    BuildContext context, {
      required String? Function(String? value) validator,
      required void Function(String value) onChanged,
      required void Function(String? value) onSaved,
      required String hintText,
      TextEditingController? controller,
      String? svgIcon,
      TextStyle? hintTextStyle,
      Widget? suffix,
      bool? show, required TextInputType textInputType,
    })
{
  return svgIcon!=null ? TextFormField(
    controller: controller,
    onSaved: onSaved,
    validator: validator,
    onChanged: onChanged,
    keyboardType: textInputType,
    cursorColor: Colors.black87,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: hintTextStyle ?? Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SvgPicture.asset( svgIcon,
          // colorFilter:
          //     const ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
      ),
      suffixIcon: suffix,
    ),
    obscureText: show!,
  ) : TextFormField(
    onSaved: onSaved,
    validator: validator,
    onChanged: onChanged,
    keyboardType: TextInputType.visiblePassword,
    cursorColor: Colors.black,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle:
      Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
      suffixIcon: suffix,
    ),
    obscureText: show!,
  );
}
