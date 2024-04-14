
import 'package:animation_2/components/fav_btn.dart';
import 'package:animation_2/components/price.dart';
import 'package:animation_2/constants.dart';
import 'package:animation_2/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animation_2/controllers/home_controller.dart'; // Import your HomeController

import 'components/cart_counter.dart';



class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {Key? key, required this.product, required this.onProductAdd})
      : super(key: key);

  final Product product;
  final VoidCallback onProductAdd;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String _cartTag = "";
  int quantity = 1; // Add this line to keep track of the quantity
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: ElevatedButton(
              onPressed: () {
                widget.onProductAdd();
                setState(() {
                  _cartTag = '_cartTag';
                });
                Navigator.pop(context);
              },
              child: Text("Add to Cart"),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: Color(0xFFF8F8F8),
                  child: Hero(
                    tag: widget.product.title! + _cartTag,
                    child: Image.asset(widget.product.image!),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  child: CartCounter(
                    quantity: widget.product.quantity,
                    onAdd: () {
                      setState(() {
                        widget.product.increment();
                      });
                    },
                    onRemove: () {
                      setState(() {
                        if (widget.product.quantity > 1) {
                          widget.product.decrement();
                          Provider.of<HomeController>(context, listen: false).removeProductFromCart(widget.product);
                        }
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: defaultPadding * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.title!,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Price(amount: "${widget.product.prices[widget.product.size]}"),
                SizedBox(height: defaultPadding),
                DropdownButton<ProductSize>(
                  value: widget.product.size,
                  onChanged: (ProductSize? newSize) {
                    setState(() {
                      widget.product.size = newSize!;
                    });
                  },
                  items: ProductSize.values.map((ProductSize size) {
                    return DropdownMenuItem<ProductSize>(
                      value: size,
                      child: Text(size.toString().split('.').last),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              "Cadbury Dairy Milk is a rich and creamy milk chocolate bar renowned for its velvety texture and sweet, comforting taste. It's a classic treat beloved worldwide, perfect for savoring alone or sharing with others.",
              style: TextStyle(
                color: Color(0xFFBDBDBD),
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: BackButton(
        color: Colors.black,
      ),
      backgroundColor: Color(0xFFF8F8F8),
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Chocolates",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        FavBtn(radius: 20),
        SizedBox(width: defaultPadding),
      ],
    );
  }
}
