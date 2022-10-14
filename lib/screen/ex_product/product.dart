class Product {
  Product({required this.name, required this.price});

  final String name;
  final double price;
}

enum ProductSortType {
  name,
  price,
}