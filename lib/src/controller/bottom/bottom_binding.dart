import 'package:get/get.dart';
import 'package:presentation/src/controller/category/category_controller.dart';
import 'package:presentation/src/controller/home/home_controller.dart';

class BottomBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CategoryController>(() => CategoryController());
  }
}
