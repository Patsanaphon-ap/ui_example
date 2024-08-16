import 'package:flutter/material.dart';
import 'package:presentation/src/ui/page/home/widget/discount_widget.dart';
import 'package:presentation/src/ui/page/home/widget/flash_sales_widget.dart';
import 'package:presentation/src/ui/page/home/widget/location_widget.dart';
import 'package:presentation/src/ui/widget/my_appbar.dart';
import 'package:presentation/src/ui/widget/my_page.dart';

/// Displays a list of SampleItems.
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyPage(
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Column(
              children: [
                const MyAppbar(
                  title: 'Hello, User',
                  subtitle: "Hey, Let's Order some thing!",
                ),
                const LocationWidget(),
                // const MenuWidget(),
                const DiscountWidget(),
                FlashSalesWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
