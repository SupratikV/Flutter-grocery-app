import 'package:animation_2/components/price.dart';
import 'package:animation_2/models/ProductItem.dart';
import 'package:flutter/material.dart';
import 'package:animation_2/controllers/home_controller.dart';

import '../../../constants.dart';

class CartDetailsViewCard extends StatelessWidget {
  const CartDetailsViewCard({
    Key? key,
    required this.productItem,
    required this.controller,  // Add this line
  }) : super(key: key);

  final ProductItem productItem;
  final HomeController controller;  // Add this line

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(productItem.product!.image!),
      ),
      title: Text(
        "${productItem.product!.title!} (${productItem.product!.size.toString().split('.').last})",
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: FittedBox(
        child: Row(
          children: [
            Price(amount: productItem.product!.prices[productItem.product!.size]!.toString()),
            Text(
              "  x ${productItem.quantity}",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {
                controller.removeProductFromCart(productItem.product!);  // Modify this line
              },
            ),
          ],
        ),
      ),
    );
  }
}