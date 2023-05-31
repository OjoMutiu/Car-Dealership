import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/screens/home/home.dart';
import 'package:oloworay_autos/src/screens/splash/splash_screen.dart';
import 'package:oloworay_autos/src/utils/theme/theme.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme, //if you want light theme, this is how to call it
      darkTheme: AppTheme.darkTheme, //for dark theme, change to darkTheme
      themeMode: ThemeMode.system, //sets the theme of the app to system's theme
      home: const MySplashscreen(),//const MyHomeScreen(userName: 'Ofure2',),//
    );
  }
}
