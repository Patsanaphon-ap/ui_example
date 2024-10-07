import 'package:get/get.dart';
import 'package:presentation/src/data/models/product_detail_model.dart';

class CartController extends GetxController {
  bool isloading = true;
  List<ProductModel> productCart = [];
  RxInt count = 0.obs;

  double subtotal = 0.00;
  double delivery = 0.00;
  double discount = 0.00;
  double grandtotal = 0.00;

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 400))
        .then((value) => onLoadData());
    super.onInit();
  }

  Future<void> onLoadData({bool refresh = false}) async {
    isloading = true;
    update();

    isloading = false;
    update();
  }

  Future<void> onAddProduct(
      {required ProductModel productData, int qty = 1}) async {
    isloading = true;
    update();
    // Check if the product already exists in the cart
    var index = productCart.indexWhere((e) => e.id == productData.id);
    if (index != -1) {
      // If the product exists in the cart, update the quantity
      var updatedProduct = productCart[index];
      updatedProduct.qty += qty;

      // Replace the product in the cart with the updated version
      productCart[index] = updatedProduct;
    } else {
      productData.qty = qty;
      productCart.add(productData);
    }
    updateSummary();

    isloading = false;
    update();
  }

  void onDeleteProduct({required ProductModel productDelete}) {
    productCart.removeWhere((item) => item.id == productDelete.id);
    // Recalculate subtotal, delivery, discount, and grand total
    subtotal =
        productCart.fold(0.0, (sum, item) => sum + (item.price * item.qty));
    updateSummary();
    update();
  }

  void increaseQty({required int index}) {
    // If the product exists in the cart, update the quantity
    var updatedProduct = productCart[index];
    updatedProduct.qty += 1;

    // Replace the product in the cart with the updated version
    productCart[index] = updatedProduct;
    updateSummary();
    update();
  }

  void decreaseQty({required int index}) {
    // If the product exists in the cart, update the quantity
    var updatedProduct = productCart[index];
    updatedProduct.qty -= 1;

    // Replace the product in the cart with the updated version
    productCart[index] = updatedProduct;
    updateSummary();
    update();
  }

  void updateSummary() {
    // Update the cart count
    count.value = productCart.length;
    // Recalculate subtotal
    subtotal =
        productCart.fold(0.0, (sum, item) => sum + (item.price * item.qty));
    //  delivery cost
    delivery = 20.10;
    //  discount of 15% on the subtotal
    discount = subtotal * 0.15; // 15% discount
    // Calculate grand total
    grandtotal = subtotal + delivery - discount;
  }
}
