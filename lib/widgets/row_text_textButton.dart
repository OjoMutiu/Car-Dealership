import 'package:flutter/material.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';


class RowTextButton extends StatelessWidget {
  const RowTextButton({
    super.key,
    required this.rowText,
    required this.rowButton, this.tap, this.textTextStyle, this.btnTextStyle,
  });
  final String rowText, rowButton;
  final TextStyle? textTextStyle, btnTextStyle;
  final void Function() ? tap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(rowText,
            style: textTextStyle ?? Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(
                fontSize: AppDimension.font14,
                color: AppColors.textBody1)),
        GestureDetector(
          onTap: tap,
          child: Text(
            rowButton,
            style: btnTextStyle ?? Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(
                fontSize: AppDimension.font14,
                color: AppColors.primary500),
          ),
        )
      ],
    );
  }
}
