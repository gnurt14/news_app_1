import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/home/sub_screen/sub_discover/page.dart';
import 'package:news_app/pages/home/sub_screen/sub_home/page.dart';
import 'package:news_app/pages/home/sub_screen/sub_saved/page.dart';
import 'package:news_app/pages/home/sub_screen/sub_user/page.dart';

class HomeController extends GetxController{
  var currentIndex = 0.obs;
  final CarouselSliderController carouselController = CarouselSliderController();
  final List screens = [
    const HomeSubScreen(),
    const DiscoverSubScreen(),
    const SavedSubScreen(),
    const UserSubScreen(),
  ];

  void updateIndexBottomNavigation(int index){
    currentIndex.value = index;
    update();
  }
}
