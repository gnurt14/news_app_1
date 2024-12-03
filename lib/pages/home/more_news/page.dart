import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/home/controller.dart';

import '../../../widgets/news_box.dart';
import '../../news_detail/page.dart';

class MoreNews extends StatelessWidget {
  final String label;

  const MoreNews({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (controller){
        return Scaffold(
          appBar: AppBar(
            title: Text(label),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: ListView.separated(
                itemCount: controller.getRecommendNews().length,
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
          ),
        );
      },
    );
  }
}
