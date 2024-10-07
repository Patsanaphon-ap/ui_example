import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/config/route_path.dart';
import 'package:presentation/src/controller/most_popular/most_popular_controller.dart';
import 'package:presentation/src/ui/page/home/widget/product_card_widget.dart';
import 'package:presentation/src/ui/widget/my_load_widget.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class MostPopularWidget extends StatelessWidget {
  MostPopularWidget({super.key});
  final mostPopularCtrl = Get.put(MostPopularController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MostPopularController>(
      builder: (_) {
        if (mostPopularCtrl.isloading) {
          return Center(
            child: MyLoadingWidget(),
          );
        }
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text18Bold(
                    'Most Popular',
                  ),
                  //ClockCount
                  text18NormalTheme(
                    context,
                    'See More',
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: (Get.height * 0.3),
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return ProductCardWidget(
                                herotag: "most-popular-${index}",
                                type: mostPopularCtrl.product[index].category,
                                title: mostPopularCtrl.product[index].title,
                                price: mostPopularCtrl.product[index].price
                                    .toString(),
                                rating: mostPopularCtrl.product[index].rating
                                    .toString(),
                                commentcount: mostPopularCtrl
                                    .product[index].comment
                                    .toString(),
                                onTap: () {
                                  Get.toNamed(
                                    RoutePath.productdetail,
                                    arguments: {
                                      'herotag': "most-popular-${index}",
                                      'image': mostPopularCtrl
                                          .product[index].thumbnail,
                                      'sku': mostPopularCtrl.product[index].id
                                    },
                                  );
                                },
                                photo: mostPopularCtrl.product[index].thumbnail,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 10,
                              );
                            },
                            itemCount: mostPopularCtrl.product.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
