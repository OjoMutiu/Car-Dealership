import 'package:flutter/material.dart';

import 'color.dart';

class RowTextButton extends StatelessWidget {
  const RowTextButton({
    super.key,
    required this.rowText,
    required this.rowButton, this.ontap,
  });
  final String rowText, rowButton;
  final void Function() ? ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(rowText,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: kBodyTextColor)),
        GestureDetector(
          onTap: ontap,
          child: Text(
            rowButton,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: kPrimaryColor),
          ),
        )
      ],
    );
  }
}
