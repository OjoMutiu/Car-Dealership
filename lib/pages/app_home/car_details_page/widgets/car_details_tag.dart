import 'package:flutter/material.dart';

import 'car_details_body.dart';


class CarDetailTag extends StatelessWidget {
  const CarDetailTag({
    super.key,
    required this.widget, required this.headerText, required this.text,
  });
  final String headerText, text;
  final CarDetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headerText, style: const TextStyle(
            color: Color(0xFFB5B5B5),
            fontSize: 11,
            fontWeight: FontWeight.normal
        ),),
        Text(text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: const Color(0xFF0B4D51)
          ),),
      ],
    );
  }
}