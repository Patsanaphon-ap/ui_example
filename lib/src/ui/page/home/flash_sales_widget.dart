import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/config/route_path.dart';
import 'package:presentation/src/controller/clock/clock_controller.dart';
import 'package:presentation/src/ui/page/home/widget/flash_sales_clock_widget.dart';
import 'package:presentation/src/ui/page/home/widget/product_card_widget.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class FlashSalesWidget extends StatelessWidget {
  FlashSalesWidget({super.key});
  final timerCtrl = Get.put(ClockController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
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
                              index: index,
                              onTap: () {
                                Get.toNamed(
                                  RoutePath.productdetail,
                                  arguments: {
                                    'herotag': "flashsalse-${index}",
                                  },
                                );
                              },
                              photo:
                                  'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
                        },
                        separatorBuilder: (BuildContext context, int index) {
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
  }
}
