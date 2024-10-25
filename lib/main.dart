import 'package:flutter/material.dart';
import 'package:news_app/pages/home/page.dart';
import 'package:news_app/router.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomePage(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
    );
  }
}

