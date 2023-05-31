import 'package:flutter/material.dart';

import '../../constant/color.dart';


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
              ?.copyWith(color: kHeadLineTextColor),
        ),
        const Spacer(),
        TextButton(
            onPressed: onPressed,
            child: Text(
              btnText!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: kPrimaryColor),
            ))
      ],
    ):Row(
      children: [
        Text(
          sectionText,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: kHeadLineTextColor),
        ),
      ],
    );
  }
}