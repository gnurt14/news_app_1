// import 'package:flutter/material.dart';
// import 'package:news_app/pages/home/more_news/controller.dart';
// import 'package:vhv_basic/basic.dart';
//
// class MoreNews extends StatelessWidget {
//   final String label;
//   final bool isBreakingNews;
//
//   const MoreNews({
//     super.key,
//     required this.label,
//     required this.isBreakingNews,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ScaffoldListBase<MoreNewsController>(
//       appBar: AppBar(
//         title: Text(label),
//       ),
//       init: MoreNewsController(),
//       separatorBuilder: (context, index) => index == 0
//           ? const SizedBox()
//           : const SizedBox(
//               height: 2,
//             ),
//       detailBuilder: (controller, item, onSelected, isSelected) {
//         return ItemListBase(
//           title: item['title'],
//           onTap: () {},
//         );
//       },
//     );
//   }
// }
