import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/auth/controller.dart';
import 'package:news_app/pages/auth/signup/page.dart';
import 'package:news_app/widgets/new_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AuthController(),
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/10255/10255277.png',
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => TextField(
                      obscureText: controller.isObscureText.value,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.isObscureText.value =
                                !controller.isObscureText.value;
                          },
                          icon: Icon(controller.isObscureText.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        hintText: 'Mật khẩu',
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  NewButton(label: 'Đăng nhập'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bạn chưa có tài khoản?',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => SignUpPage());
                        },
                        child: Text(
                          'Đăng ký ngay',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
