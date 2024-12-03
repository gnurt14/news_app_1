import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/home/controller.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../global.dart';
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
                        () => MoreNews(label: 'Tin mới'),
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
                                          // 'https://thanhnien.mediacdn.vn/uploaded/quanghuy/2020_12_25/rimario-dungphuong_CPEL.jpg',
                                          '$domain${article.image}',
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
              AnimatedSmoothIndicator(
                activeIndex: controller.currentSliderIndex.value,
                count: 5,
                effect: const WormEffect(),
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
                        image: controller.articlesList[index].image,
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
