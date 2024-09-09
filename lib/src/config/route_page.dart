import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/ui/page/home/home_page.dart';
import 'package:presentation/src/ui/page/pdp/product_detail_page.dart';
import 'package:presentation/src/ui/page/plp/plp_page.dart';
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
      page: () => const HomePage(),
    ),
    GetPage(
      name: RoutePath.bottomnav,
      page: () => const BottomNavBar(),
    ),
    GetPage(
      name: RoutePath.productdetail,
      page: () => ProductDetailPage(),
    ),
    GetPage(
      name: RoutePath.productlist,
      page: () => PLPPage(),
    ),
  ];
}
