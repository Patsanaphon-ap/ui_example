import 'package:get/get.dart';
import 'package:presentation/src/controller/cart/cart_controller.dart';
import 'package:presentation/src/controller/coupon/coupon_controller.dart';
import 'package:presentation/src/controller/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<CouponController>(() => CouponController());
  }
}
