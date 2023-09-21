import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_ecommerce_fakestore_app/domain/i_product_repo.dart';
import 'package:sample_ecommerce_fakestore_app/domain/product.dart';
import 'package:sample_ecommerce_fakestore_app/infrastructure/product_repo.dart';

final productRepoProvider = Provider<IProductRepo>((ref) {
  return ProductRepo();
});

final productListProvider = FutureProvider<List<Product>>((ref) async {
  final products = await ref.read(productRepoProvider).getProducts();
  return products;
});
