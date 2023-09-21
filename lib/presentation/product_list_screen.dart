import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_ecommerce_fakestore_app/application/product_provider.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(context, ref) {
    final productList = ref.watch(productListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('E-commerce App')),
      body: productList.when(
        data: (products) {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                leading: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(product.image),
                ),
                title: Text(product.title,
                    style: Theme.of(context).textTheme.titleMedium),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.description,
                        maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price: \$${product.price}',
                            style: Theme.of(context).textTheme.labelSmall),
                        Text('Category: \$${product.category}',
                            style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
