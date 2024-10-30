import 'package:flutter/material.dart';
import 'package:flutter_payment/core/app_icons.dart';
import 'package:flutter_payment/presentation/checkout/views/widgets/product_card.dart';
import 'package:provider/provider.dart';

import '../../../../core/models/product.dart';
import '../checkout_viewmodel.dart';

class ProductsListSection extends StatelessWidget {
  const ProductsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutViewModel>(
      builder: (BuildContext context, CheckoutViewModel viewModel,
              Widget? child) =>
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: viewModel.checkoutItems.length,
              itemBuilder: (context, index) {
                final checkoutItem = viewModel.checkoutItems[index];
                return ProductCard(
                  key: UniqueKey(),
                  checkoutItem: checkoutItem,
                  onDecrement: () => viewModel.decreaseQuantity(checkoutItem),
                  onIncrement: () => viewModel.increaseQuantity(checkoutItem),
                  onRemove: () => viewModel.removeItem(checkoutItem),
                );
              }),
    );
  }
}
