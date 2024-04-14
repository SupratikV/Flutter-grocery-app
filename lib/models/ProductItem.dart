import 'Product.dart';

class ProductItem {
  int quantity;
  final Product? product;

  ProductItem({this.quantity = 1, required this.product});

  void increment() {
    quantity++;
  }

  void decrement() {
    quantity--;
  }

  double get price => product?.price ?? 0.0;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductItem &&
        other.product!.title == product!.title &&
        other.product!.size == product!.size;
  }

  @override
  int get hashCode => product!.title.hashCode ^ product!.size.hashCode;
}