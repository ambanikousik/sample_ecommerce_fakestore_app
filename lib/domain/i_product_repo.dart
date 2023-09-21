import 'package:sample_ecommerce_fakestore_app/domain/product.dart';

abstract class IProductRepo {
  Future<List<Product>> getProducts();
}
