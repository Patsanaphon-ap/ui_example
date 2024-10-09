import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/history/history_controller.dart';
import 'package:presentation/src/data/models/history_model.dart';
import 'package:presentation/src/ui/page/history/widget/history_card_widget.dart';
import 'package:presentation/src/ui/widget/my_load_widget.dart';
import 'package:presentation/src/util/format_util.dart';

class HistoryConfirmPage extends StatelessWidget {
  HistoryConfirmPage({super.key});
  final HistoryController historyCtrl =
      Get.put(tag: 'historyconfirm', HistoryController(mode: 1));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      tag: 'historyconfirm',
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
                        HistoryModel data = historyCtrl.order[index];
                        final price = money.format(data.totalPrice);
                        final date = datetimeformat.format(
                          data.orderAt ?? DateTime.now(),
                        );
                        return HistoryCardWidget(
                          onTap: null,
                          icon: (data.packageStatus == 1)
                              ? Icons.pending_actions_outlined
                              : Icons.receipt_long_outlined,
                          orderDate: date,
                          shippingInfo: data.shippingInfo,
                          shippingName: data.shippingName,
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
            ],
          ),
        );
      },
    );
  }
}
