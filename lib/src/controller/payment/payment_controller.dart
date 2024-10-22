import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/config/route_path.dart';
import 'package:presentation/src/controller/cart/cart_controller.dart';
import 'package:presentation/src/data/models/product_detail_model.dart';

enum PaymentState {
  cash,
  debit,
  credit,
  promotPay,
}

extension PaymentOption on PaymentState {
  bool get iscash => this == PaymentState.cash;

  bool get isdebit => this == PaymentState.debit;

  bool get iscredit => this == PaymentState.credit;

  bool get ispromtpay => this == PaymentState.promotPay;
}

class PaymentController extends GetxController {
  final cartCtrl = Get.find<CartController>();

  bool isloading = true;
  Rx<PaymentState> onPaymentMethod = PaymentState.cash.obs;

  //Credit and debit
  TextEditingController cardNum = TextEditingController();
  TextEditingController cardExpire = TextEditingController();
  TextEditingController cardCVV = TextEditingController();
  TextEditingController cardHolderName = TextEditingController();

  List<ProductModel> productCart = <ProductModel>[];
  String addressShipping = '';

  @override
  void onInit() {
    productCart = cartCtrl.productCart;
    addressShipping = cartCtrl.onSelectAddress.value;
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose controllers to prevent memory leaks
    cardNum.dispose();
    cardExpire.dispose();
    cardCVV.dispose();
    cardHolderName.dispose();
    super.onClose();
  }

  void setPaymentMethod({required PaymentState method}) {
    onPaymentMethod.value = method;
  }

  void onPayNow() async {
    isloading = true;
    update();
    Get.toNamed(RoutePath.pay);
    await Future.delayed(const Duration(seconds: 2));

    if (onPaymentMethod.value != PaymentState.promotPay) {
      Get.offAllNamed(RoutePath.thanksyou);
    }
    await Future.delayed(const Duration(seconds: 1));
    isloading = false;
    update();
  }

  void promptPayConfirm() {
    isloading = true;
    update();
    Get.offAllNamed(RoutePath.thanksyou);
    isloading = false;
    update();
  }
}
