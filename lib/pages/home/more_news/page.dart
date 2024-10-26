import 'package:flutter/material.dart';
import 'package:news_app/pages/home/controller.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/news_detail/page.dart';
import 'package:news_app/widgets/news_box.dart';

class MoreNews extends StatelessWidget {
  final String label;
  final bool isBreakingNews;

  const MoreNews(
      {super.key, required this.label, required this.isBreakingNews});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () =>
                            NewsDetail(article: controller.articlesList[index]),
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
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: isBreakingNews
                    ? controller.getLatestNews().take(10).length
                    : controller.getRecommendNews().take(10).length,
              ),
            ),
          ),
        );
      },
    );
  }
}
