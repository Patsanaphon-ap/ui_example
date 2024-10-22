import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/bottom/bottom_binding.dart';
import 'package:presentation/src/controller/category/category_binding.dart';
import 'package:presentation/src/controller/home/home_binding.dart';
import 'package:presentation/src/controller/payment/payment_binding.dart';
import 'package:presentation/src/ui/page/cart/cart_page.dart';
import 'package:presentation/src/ui/page/category/category_page.dart';
import 'package:presentation/src/ui/page/coupon/coupon_page.dart';
import 'package:presentation/src/ui/page/history/history_page.dart';
import 'package:presentation/src/ui/page/home/home_page.dart';
import 'package:presentation/src/ui/page/option/option_page.dart';
import 'package:presentation/src/ui/page/pay/pay_page.dart';
import 'package:presentation/src/ui/page/payment/payment_page.dart';
import 'package:presentation/src/ui/page/pdp/product_detail_page.dart';
import 'package:presentation/src/ui/page/plp/plp_page.dart';
import 'package:presentation/src/ui/page/thanks/thanks_page.dart';
import 'package:presentation/src/ui/widget/my_bottom_nav.dart';

import 'route_path.dart';

class RoutePages {
  RoutePages._();

  static final routes = [
    GetPage(
        name: RoutePath.pageNotfound,
        page: () =>
            const Scaffold(body: Center(child: Text('Page Not Found.')))),
    GetPage(
      name: RoutePath.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutePath.history,
      page: () => HistoryPage(),
    ),
    GetPage(
      name: RoutePath.category,
      page: () => CategoryPage(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: RoutePath.profile,
      page: () => OptionPage(),
    ),
    GetPage(
      name: RoutePath.bottomnav,
      page: () => BottomNavBar(),
      binding: BottomBinding(),
    ),
    GetPage(
      name: RoutePath.productdetail,
      page: () => ProductDetailPage(),
    ),
    GetPage(
      name: RoutePath.productlist,
      page: () => PLPPage(),
    ),
    GetPage(
      name: RoutePath.cart,
      page: () => CartPage(),
    ),
    GetPage(
      name: RoutePath.coupon,
      page: () => CouponPage(),
    ),
    GetPage(
      name: RoutePath.payment,
      page: () => PaymentPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: RoutePath.pay,
      page: () => PayPage(),
    ),
    GetPage(
      name: RoutePath.thanksyou,
      page: () => ThankePage(),
    )
  ];
}
