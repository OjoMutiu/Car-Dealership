import 'package:flutter/material.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';

import '../constants/app_colors.dart';

class TextFormFieldHeader extends StatelessWidget {
  const TextFormFieldHeader({
    super.key, required this.headerText, this.asterisk,
  });

  final String headerText;
  final String? asterisk;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(headerText, style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: AppDimension.font14,
            color: AppColors.text
        )),
        asterisk != null ? Text('*', style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: AppDimension.font14,
            color: AppColors.text
        )): const Text('', style: TextStyle(
          fontSize: 0.5
        ),),
      ],
    );
  }
}