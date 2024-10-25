import 'package:flutter/material.dart';
import 'package:news_app/pages/news_detail/controller.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class NewsDetail extends GetView<NewsController> {
  final String source;
  final String content;

  const NewsDetail({super.key, required this.source, required this.content});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      init: NewsController(),
      builder: (value) {
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 32, // Smaller icon size
                    color: Colors.white,
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        const Color(0xff30393C).withOpacity(0.5)),
                  ),
                  padding: EdgeInsets.zero, // No padding to keep it tight
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      print('Bookmark');
                    },
                    icon: const Icon(
                      Icons.bookmark_border,
                      size: 32, // Smaller icon size
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          const Color(0xff30393C).withOpacity(0.5)),
                    ),
                    padding: EdgeInsets.zero, // No padding to keep it tight
                  ),
                  IconButton(
                    onPressed: () {
                      print('More');
                    },
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 32, // Smaller icon size
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          const Color(0xff30393C).withOpacity(0.5)),
                    ),
                    padding: EdgeInsets.zero, // No padding to keep it tight
                  ),
                ],
                elevation: 0,
                bottom: PreferredSize(
                  preferredSize: Size(0, AppBar().preferredSize.height),
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          source,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.verified,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    'https://thanhnien.mediacdn.vn/uploaded/quanghuy/2020_12_25/rimario-dungphuong_CPEL.jpg',
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    parse(content).outerHtml,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
