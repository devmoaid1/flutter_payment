import 'package:flutter/material.dart';
import 'package:flutter_payment/core/app_icons.dart';
import 'package:flutter_payment/presentation/checkout/views/widgets/product_card.dart';

import '../../../../core/models/product.dart';

class ProductsListSection extends StatelessWidget {
  const ProductsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) => const ProductCard(
        product: Product(
            image: Assets.assetsIconsProduct,
            name: "Fancy Sofa",
            price: 120.00),
      ),
    );
  }
}
