import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:presentation/src/data/models/category_model.dart';

class CategoryController extends GetxController {
  bool isloading = true;
  List<CateogryModel> category = [];

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
        await rootBundle.loadString('assets/json/category.json');
    // Parse the JSON string into a Map
    final Map<String, dynamic> response = jsonDecode(jsonString);
    category = List<CateogryModel>.from(
      (response['category'] ?? []).map(
        (e) => CateogryModel.fromJson(e),
      ),
    );
    isloading = false;
    update();
  }
}
