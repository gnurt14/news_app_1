import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/home/controller.dart';

class UserSubScreenEdit extends StatelessWidget {
  const UserSubScreenEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Chỉnh sửa thông tin tài khoản'),
            ),
            body: Column(
              children: [

              ],
            ),
          );
        });
  }
}
