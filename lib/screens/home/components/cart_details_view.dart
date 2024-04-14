import 'package:animation_2/constants.dart';
import 'package:animation_2/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'cart_detailsview_card.dart';

class CartDetailsView extends StatelessWidget {
  const CartDetailsView({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    double totalPrice = controller.cart.fold(0, (previousValue, item) => previousValue + item.product!.prices[item.product!.size]! * item.quantity);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cart", style: Theme.of(context).textTheme.titleLarge),
          ...List.generate(
            controller.cart.length,
            (index) => CartDetailsViewCard(
              productItem: controller.cart[index],
              controller: controller,  // Add this line
            ),
          ),
          SizedBox(height: defaultPadding),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Next - ₹${totalPrice.toStringAsFixed(2)}"),
            ),
          )
        ],
      ),
    );
  }
}