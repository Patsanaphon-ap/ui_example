import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:presentation/src/data/models/history_model.dart';

class HistoryController extends GetxController {
  bool isloading = true;
  List<HistoryModel> order = [];
  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 400))
        .then((value) => onLoadData());
    super.onInit();
  }

  void onLoadData() async {
    isloading = true;
    update();

    String jsonString = await rootBundle.loadString('assets/json/history.json');
    // Parse the JSON string into a Map
    final Map<String, dynamic> response = jsonDecode(jsonString);
    order = List<HistoryModel>.from(
      (response['history'] ?? []).map(
        (e) => HistoryModel.fromJson(e),
      ),
    );
    isloading = false;
    update();
  }
}
