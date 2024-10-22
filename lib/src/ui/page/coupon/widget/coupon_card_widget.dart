import 'package:flutter/material.dart';
import 'package:presentation/src/data/models/coupon_model.dart';
import 'package:presentation/src/ui/widget/my_text.dart';
import 'package:presentation/src/util/format_util.dart';

class CouponCardWidget extends StatelessWidget {
  final CouponModel data;
  final VoidCallback? onPressed;
  final VoidCallback? onTapInfo;
  const CouponCardWidget(
      {super.key, required this.data, this.onPressed, this.onTapInfo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapInfo,
      child: ClipPath(
        clipper: CouponPainter(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text18Bold(data.code),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: text12Boldwhite('Limited'),
                  ),
                ],
              ),
              text24Bold(data.discount.title),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text14Normal(
                          data.terms,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        text14NormalGrey(
                            'Userd by ${dateformat.format(data.expirationDate ?? DateTime.now())}'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: text14Bold("Apply"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CouponPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(0.0, size.height / 2 - 4);
    path.relativeArcToPoint(const Offset(0, 30),
        radius: const Radius.circular(10.0), largeArc: true);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 2 + 26);
    path.arcToPoint(Offset(size.width, size.height / 2 - 4),
        radius: const Radius.circular(10.0), clockwise: true);
    path.lineTo(size.width, 0);
    path.lineTo(0.0, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
