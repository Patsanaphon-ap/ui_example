import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/clock/clock_controller.dart';
import 'package:presentation/src/ui/page/home/widget/flash_sales_clock_widget.dart';
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
        // Row(
        //   children: [
        //     Expanded(
        //       child: Container(
        //         color: Colors.blue,
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             SizedBox(
        //               height: 400,
        //               child: ListView.separated(
        //                 padding: EdgeInsets.zero,
        //                 scrollDirection: Axis.horizontal,
        //                 itemBuilder: (BuildContext context, int index) {
        //                   return Container(
        //                     width: 10,
        //                     height: 10,
        //                     color: Colors.red,
        //                   );
        //                 },
        //                 separatorBuilder: (BuildContext context, int index) {
        //                   return const SizedBox(
        //                     width: 10,
        //                   );
        //                 },
        //                 itemCount: 25,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     )
        //   ],
        // ),
      ],
    );
  }
}
