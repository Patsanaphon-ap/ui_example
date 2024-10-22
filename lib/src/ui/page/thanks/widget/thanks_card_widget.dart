import 'package:flutter/material.dart';
import 'package:presentation/src/data/models/product_detail_model.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

import '../../../../util/format_util.dart';

class ThanksCardWidget extends StatelessWidget {
  final ProductModel data;
  const ThanksCardWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Row(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
                child: Image.network(
                  data.thumbnail,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text18Bold(
                            data.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          text14Normal(
                            data.brand,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    text18NormalColor(
                      'x${data.qty}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                text18Bold(
                  '\$ ${money.format((data.price * data.qty))}',
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
