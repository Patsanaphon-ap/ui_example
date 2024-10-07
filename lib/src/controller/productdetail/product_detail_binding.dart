import 'package:get/get.dart';
import 'package:presentation/src/controller/productdetail/product_detail_controller.dart';

class ProductDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(() => ProductDetailController());
  }
}
