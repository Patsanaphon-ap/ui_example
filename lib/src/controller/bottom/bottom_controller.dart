import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomController extends GetxController with WidgetsBindingObserver {
  RxInt isSelectIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addObserver(this);
    super.dispose();
  }

  void onItemTapped(int index) {
    this.isSelectIndex.value = index;
  }
}
