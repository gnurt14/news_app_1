import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NewsBox extends StatelessWidget {
  const NewsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.green,
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
                  'Category: Sports',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white.withOpacity(0.5) : Colors.black.withOpacity(0.5),
                  ),
                ),
                const Text(
                  'Main content of this recommend ..........',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Author ',
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(text: '⋆', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' 10/10/2024'),
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
