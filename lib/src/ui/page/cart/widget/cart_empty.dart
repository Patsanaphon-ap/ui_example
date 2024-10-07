import 'package:flutter/material.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(10.0), // Adjust the radius as needed
            child: Image.asset(
              'assets/icons/Empty_cart.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        text18Bold('Oops! Your cart is empty'),
      ],
    );
  }
}
