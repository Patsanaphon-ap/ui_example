import 'package:get/get.dart';
import 'package:presentation/src/controller/clock/clock_controller.dart';
import 'package:presentation/src/controller/flashsales/flash_sales_controller.dart';

class FlashSalesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlashSalesController>(() => FlashSalesController());
    Get.lazyPut<ClockController>(() => ClockController());
  }
}
