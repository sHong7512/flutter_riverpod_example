import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/screen/product/product.dart';

final _products = [
  Product(name: 'iPhone', price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
];

final productSortTypeProvider = StateProvider<ProductSortType>(
      (ref) => ProductSortType.name,
);

final productsProvider = Provider<List<Product>>((ref) {
  final sortType = ref.watch(productSortTypeProvider);
  switch (sortType) {
    case ProductSortType.name:
      return _products..sort((a, b) => a.name.compareTo(b.name));
    case ProductSortType.price:
      return _products..sort((a, b) => a.price.compareTo(b.price));
  }
});