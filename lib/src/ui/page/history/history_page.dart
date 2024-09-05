import 'package:flutter/material.dart';
import 'package:presentation/src/ui/page/history/history_complete_page.dart';
import 'package:presentation/src/ui/page/history/history_confirm_page.dart';
import 'package:presentation/src/ui/page/history/history_shipping_page.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                child: text18Bold('Confirm'),
              ),
              Tab(
                child: text18Bold('Shipping'),
              ),
              Tab(
                child: text18Bold('Complete'),
              ),
            ],
          ),
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          title: text22Bold(
            'Order History',
          ),
        ),
        body: TabBarView(
          children: [
            HistoryConfirmPage(),
            HsitoryShippingPage(),
            HistoryCompletePage(),
          ],
        ),
      ),
    );
  }
}
