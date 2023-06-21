import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';


class DropDown extends StatefulWidget {
  const DropDown({Key? key,
    required this.countryCodes,
    required this.onCountryChanged}) : super(key: key);

  final List<String> countryCodes;
  final void Function(String? value) onCountryChanged;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    String selectedCountryCode = '+234';
    return Container(
      height: AppDimension.height52,
      decoration: BoxDecoration(
          color: AppColors.fade.withOpacity(0.5),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              bottomLeft: Radius.circular(6)
          )
      ),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(dropDownIcon),
            ),
            value: selectedCountryCode,
            onChanged: (value){
              setState(() {
                selectedCountryCode = value!;
              });
            },
            items: widget.countryCodes.map<DropdownMenuItem<String>>((String value){
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(value, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.black100
                  ),),
                ),
              );
            },).toList(),
          ),
        ),
      ),
    );
  }
}
