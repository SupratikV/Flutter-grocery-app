
enum ProductSize { small, medium, large }

class Product {
  final String? title, image;
  final Map<ProductSize, double> prices; // Map each size to a price
  int quantity;
  ProductSize size; // Add this line

  Product({this.title, this.image, this.prices=const {
      ProductSize.small: 10.0,
      ProductSize.medium: 20.0,
      ProductSize.large: 30.0,
    }, this.quantity = 1, this.size = ProductSize.medium}); // Add size parameter

  void increment() {
    quantity++;
  }

  void decrement() {
    if (quantity > 1) {
      quantity--;
    }
  }
  double get price => prices[size]!; // Get the price for the current size
}

List<Product> demo_products = [
  Product(title: "Dairy Milk", image: "assets/images/img_1.png", 
  prices: {
    ProductSize.small: 10.0,
    ProductSize.medium: 20.0,
    ProductSize.large: 30.0,
    },
  size: ProductSize.small),
  Product(title: "KitKat", image: "assets/images/img_2.png",
  prices: {
    ProductSize.small: 10.0,
    ProductSize.medium: 20.0,
    ProductSize.large: 30.0,
    },
  size: ProductSize.medium),
  Product(title: "5Star", image: "assets/images/img_3.png",
    prices: {
    ProductSize.small: 10.0,
    ProductSize.medium: 20.0,
    ProductSize.large: 30.0,
    },
  size: ProductSize.small),
  Product(title: "Munch", image: "assets/images/img_4.png",
    prices: {
    ProductSize.small: 10.0,
    ProductSize.medium: 20.0,
    ProductSize.large: 30.0,
    },
  size: ProductSize.small),
  Product(title: "Perk", image: "assets/images/img_5.png",
    prices: {
    ProductSize.small: 10.0,
    ProductSize.medium: 20.0,
    ProductSize.large: 30.0,
    },
  size: ProductSize.small),
];