import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/home/controller.dart';
import 'package:get/get.dart';

import '../../../../widgets/news_box.dart';
import '../../../news_detail/page.dart';

class HomeSubScreen extends StatelessWidget{
  const HomeSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Breaking News',
                style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View all',
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
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
              // onPageChanged:
            ),
            items: [1, 2, 3, 4, 5, 6].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'CNN News $i',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              const Icon(Icons.verified,
                                  color: Colors.blue),
                              const Text(
                                '  ⋆   6 hours ago',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const Text(
                            "What do you guys think? Let me know in the comments section! Thank you !!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recommendation',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View all',
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
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Get.to(() => const NewsDetail());
                    },
                    child: const NewsBox());
              },
              separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 10),
            ),
          ),
        ],
      ),
    );
  }

}