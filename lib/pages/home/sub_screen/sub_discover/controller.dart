import 'package:get/get.dart';

class DiscoverSubController extends GetxController {
  var currentIndex = 0.obs;

  void updateIndexElevatedButton(var index) {
    currentIndex.value = index;
    update();
  }
}
