import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:presentation/src/controller/history/history_controller.dart';
import 'package:presentation/src/ui/widget/my_load_widget.dart';
import 'package:presentation/src/ui/widget/my_page.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final HistoryController historyCtrl = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    return MyPage(
      useScroll: false,
      appbar: AppBar(
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        title: text22Bold(
          'Order History',
        ),
      ),
      child: GetBuilder<HistoryController>(
        builder: (_) {
          if (historyCtrl.isloading) {
            return Column(
              children: [
                Center(
                  child: MyLoadingWidget(),
                )
              ],
            );
          }
          return RefreshIndicator(
            onRefresh: () async {},
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom + 40),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          Widget status = Container();
                          switch (historyCtrl.order[index].packageStatus) {
                            case 0:
                              status = Container(
                                child: Text("test"),
                              );
                              break;
                            case 1:
                              status = Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: text18BoldWhite("Confirmed"),
                              );
                              break;
                            case 2:
                              status = Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: text18Bold("Shipped"),
                              );
                              break;
                            case 3:
                              status = Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: text18BoldWhite("Order Complete"),
                              );
                              break;
                            default:
                              status = Container(
                                child: Text("test"),
                              );
                          }
                          return InkWell(
                            onTap: () {},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text18Bold(
                                        "Order: ${historyCtrl.order[index].id}"),
                                    text14Normal(
                                      DateFormat.yMMMd().format(
                                        historyCtrl.order[index].orderAt ??
                                            DateTime.now(),
                                      ),
                                    ),
                                    status
                                  ],
                                ),
                                Column(
                                  children: [
                                    text18BoldColor(
                                      '฿ ${historyCtrl.order[index].totalPrice.toString()}',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, index) {
                          return Divider(
                            height: 24,
                          );
                        },
                        itemCount: historyCtrl.order.length,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ListView.separated(
//                                 shrinkWrap: true,
//                                 physics: NeverScrollableScrollPhysics(),
//                                 itemBuilder: (_, index2) {
//                                   return Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Expanded(
//                                         child: Container(
//                                           width: 75,
//                                           height: 75,
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                             border: Border.all(
//                                               color: Theme.of(context)
//                                                   .dividerColor,
//                                             ),
//                                             image: DecorationImage(
//                                               fit: BoxFit.cover,
//                                               image: NetworkImage(
//                                                 historyCtrl
//                                                     .order[index]
//                                                     .products![index2]
//                                                     .thumbnail,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 12,
//                                       ),
//                                       Expanded(
//                                         flex: 3,
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 text16Bold(
//                                                   historyCtrl.order[index]
//                                                       .products![index2].title,
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     text16BoldColor(
//                                                       historyCtrl
//                                                           .order[index]
//                                                           .products![index2]
//                                                           .price
//                                                           .toString(),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       text16Normal(
//                                         'QTY: ',
//                                       ),
//                                       text16Normal(
//                                         historyCtrl
//                                             .order[index].products![index2].qty
//                                             .toString(),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                                 separatorBuilder: (_, index) {
//                                   return SizedBox(
//                                     height: 12,
//                                   );
//                                 },
//                                 itemCount:
//                                     historyCtrl.order[index].products?.length ??
//                                         0,
//                               ),