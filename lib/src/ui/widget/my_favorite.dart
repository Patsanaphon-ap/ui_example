import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/favorite/favorite_controller.dart';

class MyFavoriteWidget extends StatelessWidget {
  MyFavoriteWidget({super.key});
  final FavoriteController cartCtrl = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      builder: (_) {
        return IconButton(
          onPressed: () {
            // do something
          },
          icon: _favoriteIcon(false),
        );
      },
    );
  }

  Icon _favoriteIcon(bool active) {
    if (active) {
      return Icon(
        Icons.favorite_sharp,
        color: Colors.pink,
      );
    } else {
      return Icon(
        Icons.favorite_outline_rounded,
      );
    }
  }
}
