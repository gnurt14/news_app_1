import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsBox extends StatelessWidget {
  final String category;
  final String brief;
  final String author;
  final String publishDate;

  const NewsBox({
    super.key,
    required this.category,
    required this.brief,
    required this.author,
    required this.publishDate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Container(
              color: Colors.yellow,
              child: Image.network(
                'https://thanhnien.mediacdn.vn/uploaded/quanghuy/2020_12_25/rimario-dungphuong_CPEL.jpg',
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  category,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black.withOpacity(0.5),
                  ),
                ),
                Text(
                  brief,
                  maxLines: 4,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: author.trim().isNotEmpty ? author : 'unknown',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black.withOpacity(0.4),
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                        text: ' ⋆',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' $publishDate',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
