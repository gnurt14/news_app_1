import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/home/sub_screen/sub_discover/controller.dart';

import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/news_box.dart';
import '../../../news_detail/page.dart';

class DiscoverSubScreen extends GetView<DiscoverSubController> {
  const DiscoverSubScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> listNews = [
      'All',
      'Politic',
      'Sport',
      'Education',
      'Entertainment',
      'Social'
    ];
    return GetBuilder(
        init: DiscoverSubController(),
        builder: (value) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Discover',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Text(
                  'News from all around the world',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Get.isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black.withOpacity(0.3) ,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomElevatedButton(
                        isSelected: controller.currentIndex.value == index,
                        label: listNews[index],
                        onPress: () {
                          controller.updateIndexElevatedButton(index);
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 6,
                    ),
                    itemCount: listNews.length,
                  ),
                ),
                // Custom Tab

                const SizedBox(
                  height: 20,
                ),

                // List of news
                Expanded(
                  child: ListView.separated(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => const NewsDetail());
                        },
                        child: const NewsBox(),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 10),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
