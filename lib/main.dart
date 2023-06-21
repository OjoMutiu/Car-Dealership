import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/controllers/all_controller_binding.dart';

import 'constants/app_routes.dart';
import 'constants/theme/theme.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AllControllerBinding(),
      initialRoute: '/',
      getPages: getPages,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
    );
  }
}