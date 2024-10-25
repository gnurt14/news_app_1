import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/widgets/change_mode_button.dart';

import 'controller.dart';

class ChangeModePage extends StatelessWidget {
  const ChangeModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeModeController>(
      init: ChangeModeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Dark mode'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 182,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          ChangeModeButton(
                            label: 'Turn on',
                            isSelected: controller.selectedIndex.value == 0,
                            onTap: () {
                              controller.updateSelectedIndex(0);
                              controller.turnOnDarkMode();
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Divider(
                              height: 1,
                              color: Colors.black,
                            ),
                          ),
                          ChangeModeButton(
                            label: 'Turn off',
                            isSelected: controller.selectedIndex.value == 1,
                            onTap: () {
                              controller.updateSelectedIndex(1);
                              controller.turnOffDarkMode();
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Divider(
                              height: 1,
                              color: Colors.black,
                            ),
                          ),
                          ChangeModeButton(
                            label: 'System',
                            isSelected: controller.selectedIndex.value == 2,
                            onTap: () {
                              controller.updateSelectedIndex(2);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  controller.detail[controller.selectedIndex.value],
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
