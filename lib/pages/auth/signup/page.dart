import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/auth/controller.dart';
import '../../../widgets/new_button.dart';
import '../login/page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        final emailController = TextEditingController();
        final passwordController = TextEditingController();
        final confirmPasswordController = TextEditingController();

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
                      'https://cdn-icons-png.flaticon.com/512/10255/10255269.png',
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                        () => TextField(
                      controller: passwordController,
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
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                        () => TextField(
                      controller: confirmPasswordController,
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
                        hintText: 'Nhập lại mật khẩu',
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  NewButton(
                    label: 'Đăng ký',
                    onPressed: controller.isLoading.value
                        ? null
                        : () {
                      controller.signUp(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                        confirmPasswordController.text.trim(),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bạn đã có tài khoản?',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => LoginPage());
                        },
                        child: Text(
                          'Đăng nhập ngay',
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
