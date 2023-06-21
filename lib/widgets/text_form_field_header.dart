import 'package:flutter/material.dart';

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
            color: AppColors.text
        )),
        asterisk != null ? Text('*', style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.secondary400
        )): const Text('', style: TextStyle(
          fontSize: 0.5
        ),),
      ],
    );
  }
}