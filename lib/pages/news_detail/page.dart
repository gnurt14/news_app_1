import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:news_app/global.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/pages/home/controller.dart';
import 'package:get/get.dart';

class NewsDetail extends StatelessWidget {
  final Article article;

  const NewsDetail({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
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
                      controller.addToSavedList(article);
                    },
                    icon: Icon(
                      article.isBookMark ? Icons.bookmark : Icons.bookmark_border,
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
                  preferredSize: Size(0, AppBar().preferredSize.height * 1.2),
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title,
                          maxLines: 3,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text('${article.author.trim().isNotEmpty ? article.author : 'unknown'} - ${article.publishDate}'),
                      ],
                    ),
                  ),
                ),
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height),
                      );
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.network(
                      // 'https://thanhnien.mediacdn.vn/uploaded/quanghuy/2020_12_25/rimario-dungphuong_CPEL.jpg',
                      '$domain${article.image}',
                      fit: BoxFit.cover,
                      height: 300,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Text(
                        parse(article.content).body!.text,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Nguồn: ${article.source}',
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      )
                    ],
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
