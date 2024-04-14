import 'package:animation_2/models/Product.dart';
import 'package:animation_2/models/ProductItem.dart';
import 'package:flutter/material.dart';

enum HomeState { normal, cart }

class HomeController extends ChangeNotifier {
  HomeState homeState = HomeState.normal;

  List<ProductItem> cart = [];

  void changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }

  double get totalPrice {
  return cart.fold(0, (total, currentProduct) => total + currentProduct.price * currentProduct.quantity);
}

void addProductToCart(Product product, int quantity) {
  // Create a new Product instance with the same properties
  Product newProduct = Product(
    title: product.title,
    image: product.image,
    prices: product.prices,
    size: product.size,
  );

  for (ProductItem item in cart) {
    if (item.product!.title == newProduct.title && item.product!.size == newProduct.size) {
      for (int i = 0; i < quantity; i++) {
        item.increment();
      }
      notifyListeners();
      return;
    }
  }
  cart.add(ProductItem(product: newProduct, quantity: quantity));
  notifyListeners();
}

void removeProductFromCart(Product product) {
  ProductItem? itemToRemove;

  for (ProductItem item in cart) {
    if (item.product!.title == product.title && item.product!.size == product.size) {
      item.decrement();
      if (item.quantity <= 0) {
        itemToRemove = item;
      }
      break;
    }
  }

  if (itemToRemove != null) {
    cart.remove(itemToRemove);
  }

  notifyListeners();
}

  int totalCartItems() => cart.fold(
      0, (previousValue, element) => previousValue + element.quantity);
}
