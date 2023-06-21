import 'package:flutter/material.dart';

import 'widgets/filter_page_body.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black54,), onPressed: () {
            Navigator.pop(context);
          },
          ),
          title: Text('Filter', style: Theme.of(context).textTheme.bodyLarge,),
        ),
        body: const FilterPageBody()
    );
  }
}
