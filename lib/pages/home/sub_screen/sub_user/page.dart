import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/global.dart';
import 'package:news_app/pages/auth/login/page.dart';
import 'package:news_app/pages/home/controller.dart';
import 'package:news_app/pages/home/sub_screen/sub_user/edit/page.dart';

class UserSubScreen extends StatelessWidget {
  const UserSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 240,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 8.0,
                            ),
                            child: Column(
                              children: [
                                isLogin
                                    ? Column(
                                        children: [
                                          const CircleAvatar(
                                            radius: 48,
                                            backgroundImage: NetworkImage(
                                              'https://editorial.uefa.com/resources/0250-0c5117b83a72-956867b9220c-1000/format/wide1/cristiano_ronaldo_celebrates_his_fifth_title.jpeg',
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            'Cristiano Ronaldo',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          InkWell(
                                            onTap: (){
                                              print('Edit account information');
                                              Get.to(() => UserSubScreenEdit());
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Chỉnh sửa thông tin tài khoản',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color: controller.switchMode.value ? Colors.white : Colors.blue,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.edit,
                                                  color: controller.switchMode.value ? Colors.white : Colors.blue,
                                                  size: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 48,
                                            child: Image.network(
                                                'https://cdn-icons-png.flaticon.com/512/3177/3177440.png'),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text('Bạn chưa '),
                                              GestureDetector(
                                                onTap: () {
                                                  print('Đăng nhập');
                                                },
                                                child: const Text(
                                                  'Đăng nhập',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                  'Bạn chưa có tài khoản? '),
                                              GestureDetector(
                                                onTap: () {
                                                  print('Đăng ký');
                                                },
                                                child: const Text(
                                                  'Đăng ký ngay',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: controller.switchMode.value
                                ? Colors.grey.withOpacity(0.2)
                                : Colors.blue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Chế độ tối',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Switch(
                                  activeTrackColor: Colors.white,
                                  activeColor: Colors.green,
                                  value: controller.switchMode.value,
                                  onChanged: (value) {
                                    controller.changeThemeMode();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    isLogin
                        ? ElevatedButton(
                            onPressed: () {
                              Get.to(() => LoginPage());
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 40.0),
                              backgroundColor: Colors.white,
                            ),
                            child: const Text(
                              'Đăng xuất',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          )
                        : Container(),
                  ],
                )),
          );
        });
  }
}
