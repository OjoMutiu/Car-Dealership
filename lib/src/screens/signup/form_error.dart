import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/constant/size.dart';

import '../../constant/color.dart';

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
                (index) => buildUserError(context, error: errors[index]))
    );
  }

  Row buildUserError(BuildContext context, {required String error}) {
    return Row(
      children: [
        Icon(Icons.error_outline,
          color: Colors.redAccent,
          size: Size().getProportionateScreenHeight(14),
        ),
        SizedBox(width: Size().getProportionateScreenHeight(10) ,),
        Text(error, style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: kBodyTextColor
        ),),
      ],
    );
  }
}