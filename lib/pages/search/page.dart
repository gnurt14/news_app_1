import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/news_detail/page.dart';
import 'package:news_app/widgets/custom_elevated_button.dart';
import '../../widgets/news_box.dart';
import 'controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
    return GetBuilder<SearchxController>(
        init: SearchxController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.chevron_left),
              ),
              title: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: TextField(
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          hintText: 'Tìm kiếm',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Get.isDarkMode ? Colors.white.withOpacity(0.6) : Colors.black.withOpacity(0.3),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  // Custom Tab
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
                  // Expanded(
                  //   child: ListView.separated(
                  //     itemCount: 5,
                  //     itemBuilder: (context, index) {
                  //       return GestureDetector(
                  //         onTap: () {
                  //           Get.to(() => const NewsDetail(article: null,),);
                  //         },
                  //         // child: const NewsBox(),
                  //         child: Container(),
                  //       );
                  //     },
                  //     separatorBuilder: (BuildContext context, int index) =>
                  //         const SizedBox(height: 10),
                  //   ),
                  // ),
                  // List of news
                ],
              ),
            ),
          );
        });
  }
}
