import 'package:flutter/material.dart';

import 'color.dart';
import 'size.dart';

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
          size: Size().getProportionateScreenHeight(14),
        ),
        SizedBox(width: Size().getProportionateScreenHeight(10) ,),
        Text(errorMessage, style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: kBodyTextColor
        ),),
      ],
    );
  }
}