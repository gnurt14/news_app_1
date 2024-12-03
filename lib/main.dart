import 'package:flutter/material.dart';
import 'package:news_app/firebase_options.dart';
import 'package:news_app/pages/home/page.dart';
import 'package:news_app/router.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
GetStorage box = GetStorage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await GetStorage.init();
    runApp(const MyApp());
  } catch (e) {
    print("Firebase initialization error: $e");
  }
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