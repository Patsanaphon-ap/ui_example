import 'package:get/get.dart';
import 'package:presentation/src/controller/category/category_controller.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController());
  }
}
