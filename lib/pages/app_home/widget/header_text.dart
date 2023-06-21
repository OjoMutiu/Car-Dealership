import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: AppColors.primary600,
      fontWeight: FontWeight.normal,
    ),);
  }
}