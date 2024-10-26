import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/home/controller.dart';
import 'package:get/get.dart';

import '../../../../widgets/news_box.dart';
import '../../../news_detail/page.dart';
import '../../more_news/page.dart';

class HomeSubScreen extends StatelessWidget {
  const HomeSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tin mới',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(
                        () => const MoreNews(
                          label: 'Tin mới',
                          isBreakingNews: true,
                        ),
                      );
                    },
                    child: const Text(
                      'Xem thêm',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
              CarouselSlider(
                carouselController: controller.carouselController,
                options: CarouselOptions(
                    height: 240,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      controller.onSliderChange(index);
                    }),
                items: controller.articlesList.isNotEmpty
                    ? controller.getRecommendNews().take(5).map((article) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => NewsDetail(
                                    article: article,
                                  ),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(32),
                                      child: Container(
                                        color: Colors.yellow,
                                        child: Image.network(
                                          'https://thanhnien.mediacdn.vn/uploaded/quanghuy/2020_12_25/rimario-dungphuong_CPEL.jpg',
                                          fit: BoxFit.cover,
                                          height: 240,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                article.source,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              ),
                                              const Icon(Icons.verified,
                                                  color: Colors.blue),
                                              Text(
                                                '  ⋆   ${article.publishDate}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            article.title,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }).toList()
                    : [const Center(child: CircularProgressIndicator())],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [0, 1, 2, 3, 4].asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => controller.changeSlide(entry.key),
                    child: controller.currentSliderIndex.value == entry.key
                        ? Container(
                            width: 36,
                            height: 12.0,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          )
                        : Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.switchMode.value
                                      ? Colors.black.withOpacity(0.1)
                                      : Colors.white.withOpacity(0.5),
                            ),
                          ),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Đề xuất',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(
                        () => const MoreNews(
                          label: 'Đề xuất',
                          isBreakingNews: false,
                        ),
                      );
                    },
                    child: const Text(
                      'Xem thêm',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: controller.getRecommendNews().take(5).length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => NewsDetail(
                            article: controller.articlesList[index],
                          ),
                        );
                      },
                      child: NewsBox(
                        category: controller.articlesList[index].categoryTitle,
                        brief: controller.articlesList[index].brief,
                        author: controller.articlesList[index].author,
                        publishDate: controller.articlesList[index].publishDate,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 10),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
