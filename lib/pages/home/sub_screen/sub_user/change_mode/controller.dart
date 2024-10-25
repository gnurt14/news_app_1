import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeModeController extends GetxController {
  final selectedIndex = 0.obs;
  final List detail = [
    "Turn on detail",
    "Turn off detail",
    "System mode detail",
  ];

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  void turnOffDarkMode(){
    Get.changeTheme(ThemeData.light());
  }
  
  void turnOnDarkMode(){
    Get.changeTheme(ThemeData.dark());
  }
  
  // void turnSystemThemeMode(){
  //   Get.changeTheme(ThemeData.)
  // }
}
