import 'package:get/get.dart';
import 'package:presentation/src/controller/cart/cart_controller.dart';
import 'package:presentation/src/controller/payment/payment_controller.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
