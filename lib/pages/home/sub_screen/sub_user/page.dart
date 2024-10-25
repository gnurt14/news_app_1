import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/home/sub_screen/sub_user/controller.dart';

import 'change_theme_mode/page.dart';

class UserSubScreen extends StatelessWidget {
  const UserSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserSubController>(
        init: UserSubController(),
        builder: (value) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 48,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Nguyen Huu Trung',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => const ChangeModePage());
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 40.0),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Dark mode',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Log out');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40.0),
                      backgroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Log out',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
