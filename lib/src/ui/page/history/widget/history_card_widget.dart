import 'package:flutter/material.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class HistoryCardWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final String orderDate;
  final String shippingInfo;
  final String shippingName;
  final String price;
  const HistoryCardWidget({
    super.key,
    required this.onTap,
    required this.icon,
    required this.orderDate,
    required this.shippingInfo,
    required this.shippingName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconWidget(context),
          SizedBox(
            width: 12,
          ),
          _detailWidget(context),
          _priceWidget(),
        ],
      ),
    );
  }

  Column _priceWidget() {
    return Column(
      children: [
        text18Bold(
          '฿${price}',
        ),
      ],
    );
  }

  Expanded _detailWidget(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.schedule_outlined,
                size: 18,
              ),
              SizedBox(
                width: 8,
              ),
              text14Normal(
                orderDate,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_rounded,
                color: Colors.red,
                size: 18,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: text14Normal(
                  shippingInfo,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_rounded,
                color: Theme.of(context).primaryColor,
                size: 18,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: text14Normal(
                  shippingName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _iconWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: const BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
