import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:presentation/src/data/models/products_model.dart';

class PLPController extends GetxController {
  bool isloading = true;
  List<ProductModel> product = [];
  Rx<bool> viewtype = true.obs;
  String title = '';

  @override
  void onInit() {
    title = Get.parameters['title'] ?? '';
    Future.delayed(const Duration(milliseconds: 400))
        .then((value) => onLoadData());
    super.onInit();
  }

  void onLoadData() async {
    isloading = true;
    update();
    String jsonString =
        await rootBundle.loadString('assets/json/flashsales.json');
    // Parse the JSON string into a Map
    final Map<String, dynamic> response = jsonDecode(jsonString);
    product = List<ProductModel>.from(
      (response['products'] ?? []).map(
        (e) => ProductModel.fromJson(e),
      ),
    );
    isloading = false;
    update();
  }
}
