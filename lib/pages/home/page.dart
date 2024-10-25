import 'package:flutter/material.dart';
import 'package:news_app/pages/home/controller.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/search/page.dart';
import '../../widgets/vertical_icon_label.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (value) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  onPressed: () {
                    Get.to(() => const SearchPage());
                  },
                  icon: const Icon(
                    Icons.search_sharp,
                    size: 28,
                    color: Colors.black,
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(const Color(0xff30393C).withOpacity(0.1)),
                  ),
                  padding: EdgeInsets.zero,
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    print('Notification');
                  },
                  icon: const Icon(
                    Icons.notifications_none_outlined,
                    size: 28, // Smaller icon size
                    color: Colors.black,
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(const Color(0xff30393C).withOpacity(0.1)),
                  ),
                  padding: EdgeInsets.zero, // No padding to keep it tight
                ),
                const SizedBox(width: 20),
              ],
            ),
            body: controller.screens[controller.currentIndex.value],
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: VerticalIconLabel(
                    icon: Icons.home,
                    label: 'Home',
                    isSelected: controller.currentIndex.value == 0,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: VerticalIconLabel(
                    icon: Icons.navigation,
                    label: 'Discover',
                    isSelected: controller.currentIndex.value == 1,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: VerticalIconLabel(
                    icon: Icons.bookmark,
                    label: 'Saved',
                    isSelected: controller.currentIndex.value == 2,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: VerticalIconLabel(
                    icon: Icons.person,
                    label: 'User',
                    isSelected: controller.currentIndex.value == 3,
                  ),
                  label: '',
                ),
              ],
              currentIndex: controller.currentIndex.value,
              selectedItemColor: Colors.blue,
              onTap: (index) {
                controller.updateIndexBottomNavigation(index);
              },
            ),
          );
        });
  }
}
