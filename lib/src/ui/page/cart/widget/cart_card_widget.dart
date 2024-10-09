import 'package:flutter/material.dart';
import 'package:presentation/src/data/models/product_detail_model.dart';
import 'package:presentation/src/ui/widget/my_text.dart';
import 'package:presentation/src/util/format_util.dart';

class CartCardWidget extends StatelessWidget {
  final ProductModel data;
  final VoidCallback? onDelete;
  final VoidCallback? onDecrease;
  final VoidCallback? onIncrease;
  const CartCardWidget({
    super.key,
    required this.data,
    this.onDelete,
    this.onDecrease,
    this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
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
                    InkWell(
                      onTap: onDelete,
                      child: Icon(
                        Icons.delete_outlined,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text18Bold(
                      '\$ ${money.format((data.price * data.qty))}',
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (data.qty <= 1) ? null : onDecrease,
                          icon: Icon(Icons.remove),
                        ),
                        text18Bold(data.qty.toString()),
                        IconButton(
                          onPressed:
                              (data.stock <= data.qty) ? null : onIncrease,
                          icon: Icon(
                            Icons.add,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
