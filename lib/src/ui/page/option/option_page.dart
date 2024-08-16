import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/theme/theme_controller.dart';
import 'package:presentation/src/ui/widget/my_page.dart';

class OptionPage extends StatelessWidget {
  OptionPage({super.key});
  final ThemeController _controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return MyPage(
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColorLight,
              child: const Icon(
                Icons.person_outline,
              ),
            ),
          ),
          Column(
            children: [
              Obx(
                () => Switch(
                  value: _controller.currentTheme.value == ThemeMode.dark,
                  onChanged: (value) {
                    _controller.switchTheme();
                    Get.changeThemeMode(_controller.currentTheme.value);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
