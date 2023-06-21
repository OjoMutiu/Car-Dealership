import 'package:flutter/material.dart';

import 'car_details_body.dart';
import 'car_details_tag.dart';

class CarDetailTagRow extends StatelessWidget {
  const CarDetailTagRow({
    super.key,
    required this.details,
    required this.widget, required this.index1, required this.index2, required this.index3,
  });

  final CarDetailsBody widget;
  final List<Map<String, dynamic>> details;
  final int index1, index2, index3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CarDetailTag(widget: widget, headerText: details[index1]["headerText"], text:  details[index1]["text"]),
        CarDetailTag(widget: widget, headerText: details[index2]["headerText"], text:  details[index2]["text"]),
        CarDetailTag(widget: widget, headerText: details[index3]["headerText"], text:  details[index3]["text"]),
      ],
    );
  }
}