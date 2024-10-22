import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:presentation/src/data/models/category_model.dart';

class CategoryController extends GetxController {
  bool isLoading = true;
  List<CategoryModel> category = [];

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 400))
        .then((value) => onLoadData());
  }

  void onLoadData() async {
    isLoading = true;
    update();
    try {
      // Load JSON data
      String jsonString =
          await rootBundle.loadString('assets/json/category.json');

      // Parse the JSON string into a Map
      final Map<String, dynamic> response = jsonDecode(jsonString);

      // Safely handle the category data
      if (response['category'] != null) {
        category = List<CategoryModel>.from(
          (response['category'] as List).map(
            (e) => CategoryModel.fromJson(e),
          ),
        );
      } else {
        category = []; // Initialize to an empty list if null
      }
    } catch (e) {
      print('Error loading categories: $e'); // Optional: log errors
      category = []; // Initialize to an empty list on error
    } finally {
      isLoading = false; // Reset loading state
      update(); // Update the UI
    }
  }
}
