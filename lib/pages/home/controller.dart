import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/home/sub_screen/sub_discover/page.dart';
import 'package:news_app/pages/home/sub_screen/sub_home/page.dart';
import 'package:news_app/pages/home/sub_screen/sub_saved/page.dart';
import 'package:news_app/pages/home/sub_screen/sub_user/page.dart';

import '../../models/article.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var articlesList = <Article>[].obs;
  final CarouselSliderController carouselController =
      CarouselSliderController();
  final List screens = [
    const HomeSubScreen(),
    const DiscoverSubScreen(),
    const SavedSubScreen(),
    const UserSubScreen(),
  ];

  @override
  void onInit() async{
    super.onInit();
    await getData();
  }

  void updateIndexBottomNavigation(int index) {
    currentIndex.value = index;
    update();
  }

  Future<void> getData() async {
    try {
      var response = await Dio()
          .get('https://portaltinh.coquan.vn/api/Content.Article/selectAll');

      if (response.statusCode == 200) {
        articlesList.clear();
        Map jsonData = jsonDecode(response.data)['items'];
        jsonData.forEach((key, value) {
          articlesList.add(Article.fromMap(value));
          print(value.toString());
        });
      } else {
        print(response.statusCode);
      }
      update();
    } catch (e) {
      print('Exception : $e');
    }
  }
}
