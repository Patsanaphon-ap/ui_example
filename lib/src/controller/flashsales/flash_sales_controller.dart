import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:presentation/src/data/models/products_model.dart';

class FlashSalesController extends GetxController {
  bool isloading = true;
  List<ProductModel> product = [];

  @override
  void onInit() {
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
