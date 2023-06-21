import 'package:flutter/material.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';


class FormError extends StatelessWidget {
  const FormError({
    super.key,
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(errors.length,
              (index) => buildErrorMessage(context, errorMessage: errors[0]),)
    );
  }

  Row buildErrorMessage(BuildContext context,{required String errorMessage}) {
    return Row(
      children: [
        Icon(Icons.error_outline,
          color: Colors.redAccent,
          size: AppDimension.getProportionateScreenHeight(11),
        ),
        SizedBox(width: AppDimension.getProportionateScreenWidth(5) ,),
        Text(errorMessage, style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.textBody
        ),),
      ],
    );
  }
}