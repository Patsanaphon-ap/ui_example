import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> currentTheme = ThemeMode.system.obs;
  var notificationEnabled = true.obs;

  void switchTheme() {
    currentTheme.value = currentTheme.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  void toggleNotifications(bool value) {
    notificationEnabled.value = value;
  }
}
