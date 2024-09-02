import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/config/route_path.dart';
import 'package:presentation/src/controller/clock/clock_controller.dart';
import 'package:presentation/src/controller/flashsales/flash_sales_controller.dart';
import 'package:presentation/src/ui/page/home/widget/flash_sales_clock_widget.dart';
import 'package:presentation/src/ui/page/home/widget/product_card_widget.dart';
import 'package:presentation/src/ui/widget/my_load_widget.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class FlashSalesWidget extends StatelessWidget {
  FlashSalesWidget({super.key});
  final flashSalesCtrl = Get.put(FlashSalesController());
  final timerCtrl = Get.put(ClockController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlashSalesController>(
      builder: (_) {
        if (flashSalesCtrl.isloading) {
          return Center(child: MyLoadingWidget());
        }
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text22Bold(
                    'Flash Sales',
                  ),
                  //ClockCount
                  Countedownclock()
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 18),
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
                                herotag: "flashsalse-${index}",
                                type: flashSalesCtrl.product[index].category,
                                title: flashSalesCtrl.product[index].title,
                                price: flashSalesCtrl.product[index].price
                                    .toString(),
                                rating: flashSalesCtrl.product[index].rating
                                    .toString(),
                                commentcount: flashSalesCtrl
                                    .product[index].stock
                                    .toString(),
                                onTap: () {
                                  Get.toNamed(
                                    RoutePath.productdetail,
                                    arguments: {
                                      'herotag': "flashsalse-${index}",
                                    },
                                  );
                                },
                                photo: flashSalesCtrl.product[index].thumbnail,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 10,
                              );
                            },
                            itemCount: 5,
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
