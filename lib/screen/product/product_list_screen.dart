import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/screen/product/product.dart';
import 'package:riverpod_example/screen/product/productsProvider.dart';

/// StateProvider 예제
class ProductListScreen extends ConsumerWidget{
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          DropdownButton<ProductSortType>(
            value: ref.watch(productSortTypeProvider),
            onChanged: (value) =>
            ref.read(productSortTypeProvider.notifier).state = value!,
            items: const [
              DropdownMenuItem(
                value: ProductSortType.name,
                child: Icon(Icons.sort_by_alpha),
              ),
              DropdownMenuItem(
                value: ProductSortType.price,
                child: Icon(Icons.sort),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('${product.price} \$'),
          );
        },
      ),
    );
  }

}