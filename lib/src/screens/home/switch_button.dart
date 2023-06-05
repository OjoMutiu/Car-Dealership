import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/size.dart';


class ButtonSwitcher extends StatefulWidget {
  const ButtonSwitcher({super.key});

  @override
  State<ButtonSwitcher> createState() => _ButtonSwitcherState();
}

class _ButtonSwitcherState extends State<ButtonSwitcher> {
  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Size().getProportionateScreenWidth(2),
          vertical: Size().getProportionateScreenWidth(2)),
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildButton(0, 'All'),
          buildButton(1, 'Used'),
          buildButton(2, 'New'),
        ],
      ),
    );
  }

  Widget buildButton(int buttonIndex, String text) {
    final bool isSelected = buttonIndex == selectedButtonIndex;

    return isSelected
        ? Expanded(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                selectedButtonIndex = buttonIndex;
              });
            },
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
        )
        : Expanded(
          child: TextButton(
            onPressed: () {
              setState(() {
                selectedButtonIndex = buttonIndex;
              });
            },
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: kPrimaryColor),
            ),
          ),
        );
  }
}
