import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/home/controller.dart';
import 'package:news_app/pages/news_detail/page.dart';
import 'package:news_app/widgets/news_box.dart';

import '../../../../widgets/custom_elevated_button.dart';

class DiscoverSubScreen extends StatelessWidget {
  const DiscoverSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listNews = [
      'Tất cả',
      'Chính trị',
      'Kinh tế',
      'Thể thao',
      'Giáo dục',
      'Giải trí'
    ];
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Khám phá',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                Text(
                  'Khám phá tin tức trên toàn thế giới ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.4)
                        : Colors.black.withOpacity(0.3),
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
                        isSelected:
                            controller.currentDiscoverIndex.value == index,
                        label: listNews[index],
                        onPress: () {
                          controller.updateIndexElevatedButton(index);
                          controller.getNewsByFilter(listNews[index]);
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 6),
                    itemCount: listNews.length,
                  ),
                ),

                const SizedBox(height: 10,),

                // List of news
                Expanded(
                  child: Obx(() {
                    var filteredNews = controller.getNewsByFilter(
                        listNews[controller.currentDiscoverIndex.value]);
                    return ListView.separated(
                      itemCount: filteredNews.length,
                      itemBuilder: (context, index) {
                        var article = filteredNews[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => NewsDetail(article: article));
                          },
                          child: NewsBox(
                            category: article.categoryTitle,
                            brief: article.brief,
                            author: article.author,
                            publishDate: article.publishDate,
                            image: article.image,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    );
                  }),
                ),
              ],
            ),
          );
        });
  }
}
