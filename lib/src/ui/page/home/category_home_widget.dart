import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/config/route_path.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class CategoryHomeWidget extends StatelessWidget {
  const CategoryHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _CategoryCard(
            context: context,
            icon: Icons.restaurant_outlined,
            label: 'FOOD',
          ),
          _CategoryCard(
            context: context,
            icon: Icons.local_cafe_outlined,
            label: 'COFFEE',
          ),
          _CategoryCard(
            context: context,
            icon: Icons.camera_alt_outlined,
            label: 'CAMERA',
          ),
          _CategoryCard(
            context: context,
            icon: Icons.chair_outlined,
            label: 'FURNITURE',
          ),
          _CategoryCard(
            context: context,
            icon: Icons.pets_outlined,
            label: 'PET',
          ),
        ],
      ),
    );
  }

  Widget _CategoryCard({
    required BuildContext context,
    required IconData icon,
    required String label,
  }) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          RoutePath.productlist,
          parameters: {'title': label},
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).primaryColorDark,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          text12Normal(
            label,
          ),
        ],
      ),
    );
  }
}
