import 'package:flutter/material.dart';
import 'package:karaoke_app/home_page/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ProviderScope(
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (BuildContext context, child) => const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Karaoke App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: const HomePage());
  }
}
