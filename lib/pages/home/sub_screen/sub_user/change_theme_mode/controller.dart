import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangeModeController extends GetxController {
  final selectedIndex = 0.obs;
  final List detail = [
    "Turn on detail",
    "Turn off detail",
    "System mode detail",
  ];

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = Get.isDarkMode ? 0 : 1;
  }
  void turnOnDarkMode(){
    Get.changeThemeMode(ThemeMode.dark);
    box.write('isDarkMode', true);
    print(box.read('isDarkMode'));
  }

  void turnOffDarkMode(){
    Get.changeThemeMode(ThemeMode.light);
    box.write('isDarkMode', false);
    print(box.read('isDarkMode'));
  }

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
    update();
  }
}
