import 'package:flutter/material.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class PLPListCardWidget extends StatelessWidget {
  final String herotag;
  final String photo;
  final String type;
  final String title;
  final String description;
  final String price;
  final String rating;
  final String commentcount;
  final VoidCallback? onTap;
  const PLPListCardWidget({
    super.key,
    required this.herotag,
    required this.photo,
    required this.type,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.commentcount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Hero(
                tag: herotag,
                child: Container(
                  child: Image.network(
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    photo,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text14Small(
                        type,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.favorite_border_outlined,
                        ),
                      ),
                    ],
                  ),
                  text14Bold(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  text12Normal(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                          text12Normal(
                            "${rating} | ${commentcount}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      text16BoldColor(
                        "\$${price}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
