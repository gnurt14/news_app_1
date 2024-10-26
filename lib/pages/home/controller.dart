import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:diacritic/diacritic.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/pages/home/sub_screen/sub_discover/page.dart';
import 'package:news_app/pages/home/sub_screen/sub_home/page.dart';
import 'package:news_app/pages/home/sub_screen/sub_saved/page.dart';
import 'package:news_app/pages/home/sub_screen/sub_user/page.dart';

import '../../models/article.dart';

class HomeController extends GetxController {
  // index of navigation button
  var currentIndex = 0.obs;

  // index of discover button sub screen
  var currentDiscoverIndex = 0.obs;

  // current slider index
  var currentSliderIndex = 0.obs;

  var filterList = <Article>[].obs;
  var articlesList = <Article>[].obs;
  var savedList = <Article>[].obs;
  var switchMode = false.obs;

  bool isLogin = true;

  final box = GetStorage();
  final boxSavedArticle = GetStorage();

  final CarouselSliderController carouselController =
      CarouselSliderController();

  final List screens = [
    const HomeSubScreen(),
    const DiscoverSubScreen(),
    const SavedSubScreen(),
    const UserSubScreen(),
  ];

  void changeSlide(int index) {
    currentSliderIndex.value = index;
    carouselController.jumpToPage(currentSliderIndex.value);
    update();
  }

  void onSliderChange(int index) {
    currentSliderIndex.value = index;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await getData();

    loadSavedArticles();
  }

  void updateIndexBottomNavigation(int index) {
    currentIndex.value = index;
    switchMode.value = Get.isDarkMode;
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

  List<Article> getNewsByFilter(String filter) {
    filterList.clear();
    switch (currentDiscoverIndex.value) {
      case 1:
        filterList.value = articlesList.where((news) {
          return removeDiacritics(news.author.trim().toLowerCase()) ==
              removeDiacritics('Hoàng Trọng'.trim().toLowerCase());
        }).toList();
        return filterList;
      case 2:
        return filterList;
      case 3:
        return filterList;
      case 4:
        return filterList;
      case 5:
        return filterList;
      default:
        return articlesList;
    }
  }

  List<Article> getLatestNews() {
    articlesList.sort((a, b) {
      var aViews = a.publishDate;
      var bViews = b.publishDate;
      return bViews.compareTo(aViews);
    });
    return articlesList.toList();
  }

  List<Article> getRecommendNews() {
    articlesList.sort((a, b) {
      var aViews = a.totalViews;
      var bViews = b.totalViews;
      return bViews.compareTo(aViews);
    });
    return articlesList.toList();
  }

  void addToSavedList(Article article) {
    if (isLogin) {
      article.isBookMark = !article.isBookMark;
      if (article.isBookMark) {
        savedList.add(article);
        Get.snackbar(
          'Thông báo',
          'Đã thêm vào bookmark',
          icon: const Icon(
            Icons.check_box_outlined,
            color: Colors.green,
          ),
          duration: const Duration(
            milliseconds: 1600,
          ),
        );
      } else {
        savedList.remove(article);
        Get.snackbar(
          'Thông báo',
          'Đã xoá khỏi bookmark',
          icon: const Icon(
            Icons.remove_circle_outlined,
            color: Colors.red,
          ),
          duration: const Duration(
            milliseconds: 1600,
          ),
        );
      }

      boxSavedArticle.write(
        'nameOfThisUser',
        savedList.map((article) => article.toJson()).toList(),
      );
      update();
    } else {
      Get.snackbar(
          'Thông báo', 'Bạn cần đăng nhập để sử dụng tính năng này');
    }
  }

  void changeThemeMode() {
    switchMode.value ? turnOffDarkMode() : turnOnDarkMode();
    switchMode.value = !switchMode.value;
    update();
  }

  void turnOnDarkMode() {
    Get.changeThemeMode(ThemeMode.dark);
    box.write('isDarkMode', true);
    print(box.read('isDarkMode'));
  }

  void turnOffDarkMode() {
    Get.changeThemeMode(ThemeMode.light);
    box.write('isDarkMode', false);
    print(box.read('isDarkMode'));
  }

  void updateIndexElevatedButton(var index) {
    currentDiscoverIndex.value = index;
    update();
  }

  void loadSavedArticles(){
    final savedData = boxSavedArticle.read('nameOfThisUser') ?? [];
    if (savedData is List) {
      savedList.addAll(
          savedData.map((item) => Article.fromJson(item as String)).toList());
    }
    for(var i in savedList){
      i.isBookMark = true;
    }
  }
}
