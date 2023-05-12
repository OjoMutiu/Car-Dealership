import 'package:flutter/material.dart';

import 'color.dart';

class RowTextButton extends StatelessWidget {
  const RowTextButton({
    super.key,
    required this.rowText,
    required this.rowButton, this.tap,
  });
  final String rowText, rowButton;
  final void Function() ? tap;

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
          onTap: tap,
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
