import 'package:get/get.dart';
import 'package:presentation/src/data/models/products_model.dart';

class CartController extends GetxController {
  bool isloading = true;
  List<ProductModel> productCart = [];
  RxInt count = 0.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 400))
        .then((value) => onLoadData());
    super.onInit();
  }

  Future<void> onLoadData() async {
    isloading = true;
    update();
    isloading = false;
    update();
  }

  Future<void> onAddProduct() async {}
}
