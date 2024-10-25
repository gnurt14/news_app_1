import 'package:flutter/material.dart';
import 'package:news_app/pages/home/page.dart';
import 'package:news_app/router.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart' ;

GetStorage box = GetStorage();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await GetStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomePage(),
      darkTheme: ThemeData.dark(),
      themeMode: (box.read('isDarkMode')?? false) ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
    );
  }
}