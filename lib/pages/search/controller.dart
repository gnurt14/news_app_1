import 'package:get/get.dart';

class SearchxController extends GetxController{
  var currentIndex = 0.obs;

  void updateIndexElevatedButton(var index){
    currentIndex.value = index;
    update();
  }
}