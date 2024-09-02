import 'package:flutter/material.dart';
import 'package:presentation/src/ui/page/home/category_home_widget.dart';
import 'package:presentation/src/ui/page/home/discount_widget.dart';
import 'package:presentation/src/ui/page/home/flash_sales_widget.dart';
import 'package:presentation/src/ui/page/home/location_widget.dart';
import 'package:presentation/src/ui/page/home/most_popular_widget.dart';
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
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 80,
          ),
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
                CategoryHomeWidget(),
                FlashSalesWidget(),
                MostPopularWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
