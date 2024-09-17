import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:presentation/src/data/models/product_detail_model.dart';

class ProductDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  bool isloading = true;
  ProductDetailModel product = ProductDetailModel();
  late TabController tabcontroller;

  @override
  void onInit() {
    tabcontroller = TabController(vsync: this, length: 2, initialIndex: 0);
    Future.delayed(const Duration(milliseconds: 400))
        .then((value) => onLoadData());
    super.onInit();
  }

  @override
  void onClose() {
    tabcontroller.dispose();
    super.onClose();
  }

  void onLoadData() async {
    isloading = true;
    update();
    int sku = Get.arguments['sku'];
    String jsonString =
        await rootBundle.loadString('assets/json/product_detail/${sku}.json');
    // Parse the JSON string into a Map
    final Map<String, dynamic> response = jsonDecode(jsonString);
    product = ProductDetailModel.fromJson(response['product']);
    await Future.delayed(const Duration(milliseconds: 400));
    isloading = false;
    update();
  }
}
