import 'package:flutter/material.dart';

import '../../constant/filter.dart';
import '../../constant/text_field.dart';
import '../../constant/size.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: buildTextFormField(
            context,
            validator: (value) {
              return null;
            },
            onChanged: (value) {},
            onSaved: (value) {},
            hintText: 'Search by Brand, Model or Keywords',
            textInputType: TextInputType.text,
            svgIcon: 'assets/icons/searchLens.svg',
            show: false,
          ),
        ),
        SizedBox(width: Size().getProportionateScreenWidth(20)),
        const FilterSetting(),
      ],
    );
  }
}