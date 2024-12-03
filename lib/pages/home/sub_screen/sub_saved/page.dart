import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/global.dart';
import 'package:news_app/pages/home/controller.dart';
import 'package:news_app/pages/news_detail/page.dart';
import 'package:news_app/widgets/news_box.dart';

class SavedSubScreen extends StatelessWidget {
  const SavedSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Đã lưu',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              const SizedBox(
                height: 10,
              ),
              isLogin
                  ? (controller.savedList.isNotEmpty
                      ? Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => NewsDetail(
                                      article: controller.savedList[index],
                                    ),
                                  );
                                },
                                child: NewsBox(
                                  category:
                                      controller.savedList[index].categoryTitle,
                                  brief: controller.savedList[index].brief,
                                  author: controller.savedList[index].author,
                                  publishDate:
                                      controller.savedList[index].publishDate,
                                  image: controller.savedList[index].image,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                            itemCount: controller.savedList.length,
                          ),
                        )
                      : const Center(
                          child: Text('Không có bài viết'),
                        ))
                  : const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Đăng nhập ngay để xem lại những tin tức đã lưu',
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
