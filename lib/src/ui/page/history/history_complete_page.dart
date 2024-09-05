import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/history/history_controller.dart';
import 'package:presentation/src/ui/page/history/widget/history_card_widget.dart';
import 'package:presentation/src/ui/widget/my_load_widget.dart';
import 'package:presentation/src/util/format_util.dart';

class HistoryCompletePage extends StatelessWidget {
  HistoryCompletePage({super.key});
  final HistoryController historyCtrl =
      Get.put(tag: 'historycomplete', HistoryController(mode: 3));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      tag: 'historycomplete',
      builder: (_) {
        if (historyCtrl.isloading) {
          return Center(
            child: MyLoadingWidget(),
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            print("refresh");
          },
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        if (index == historyCtrl.order.length) {
                          return SizedBox.shrink();
                        }
                        final price =
                            money.format(historyCtrl.order[index].totalPrice);
                        final date = dateformat.format(
                          historyCtrl.order[index].orderAt ?? DateTime.now(),
                        );
                        return HistoryCardWidget(
                          onTap: null,
                          icon: Icons.task_alt_outlined,
                          orderDate: date,
                          shippingInfo: historyCtrl.order[index].shippingInfo,
                          shippingName: historyCtrl.order[index].shippingName,
                          price: price,
                        );
                      },
                      separatorBuilder: (_, index) {
                        return Divider(
                          height: 24,
                        );
                      },
                      itemCount: historyCtrl.order.length + 1,
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24,
              ),
            ],
          ),
        );
      },
    );
  }
}
