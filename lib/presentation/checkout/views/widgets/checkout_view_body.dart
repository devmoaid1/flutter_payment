import 'package:flutter/material.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "This is Checkout ",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
