import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/productdetail/product_detail_controller.dart';
import 'package:presentation/src/ui/widget/my_page.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({super.key});

  final productDetailCtrl = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return MyPage(
      appbar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Builder(
                builder: (context) {
                  if (Get.arguments['herotag'] != null)
                    return Hero(
                      tag: Get.arguments['herotag'],
                      child: Image.network(
                        fit: BoxFit.cover,
                        'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      ),
                    );
                  return Image.network(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
