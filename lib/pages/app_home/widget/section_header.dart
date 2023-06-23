import 'package:flutter/material.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';

import '../../../constants/app_colors.dart';


class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key, required this.sectionText, this.btnText, this.onPressed,
  });

  final String sectionText;
  final String? btnText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return btnText!=null? Row(
      children: [
        Text(
          sectionText,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(
            fontSize: AppDimension.font14,
              color: AppColors.text),
        ),
        const Spacer(),
        TextButton(
            onPressed: onPressed,
            child: Text(
              btnText!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(
                fontSize: AppDimension.font14,
                  color: AppColors.primary500
              ),
            ))
      ],
    ):Row(
      children: [
        Text(
          sectionText,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(
              fontSize: AppDimension.font14,
              color: AppColors.text),
        ),
      ],
    );
  }
}