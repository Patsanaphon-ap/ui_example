import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/theme/theme_controller.dart';
import 'package:presentation/src/ui/widget/my_page.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class OptionPage extends StatelessWidget {
  OptionPage({super.key});
  final ThemeController _controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return MyPage(
      appbar: AppBar(
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        title: text22Bold(
          'Settings',
        ),
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: MediaQuery.of(context).padding.bottom + 80,
        ),
        children: [
          _accountWidget(),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text18BoldBlack(
                  'Preferences',
                ),
                const SizedBox(height: 10),
                Obx(() => SwitchListTile(
                      title: text14NormalBlack('Dark Mode'),
                      value: _controller.currentTheme.value == ThemeMode.dark,
                      onChanged: (value) {
                        _controller.switchTheme();
                        Get.changeThemeMode(_controller.currentTheme.value);
                      },
                    )),
                Obx(() => SwitchListTile(
                      title: text14NormalBlack('Enable Notifications'),
                      value: _controller.notificationEnabled.value,
                      onChanged: _controller.toggleNotifications,
                    )),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: text14NormalBlack('Logout'),
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  onTap: () {
                    // Handle logout logic
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _accountWidget() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text18BoldBlack(
            'Account',
          ),
          const SizedBox(height: 10),
          ListTile(
            title: text14NormalBlack('Account'),
            leading: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            onTap: () {
              // Navigate to Account settings
            },
          ),
          ListTile(
            title: text14NormalBlack('Privacy Policy'),
            leading: const Icon(
              Icons.privacy_tip,
              color: Colors.black,
            ),
            onTap: () {
              // Show Privacy Policy
            },
          ),
          ListTile(
            title: text14NormalBlack('Terms & Conditions'),
            leading: const Icon(
              Icons.description,
              color: Colors.black,
            ),
            onTap: () {
              // Show Terms & Conditions
            },
          ),
        ],
      ),
    );
  }
}
