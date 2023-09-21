// lib/infrastructure/fakestore_api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sample_ecommerce_fakestore_app/domain/i_product_repo.dart';
import 'package:sample_ecommerce_fakestore_app/domain/product.dart';

class ProductRepo extends IProductRepo {
  @override
  Future<List<Product>> getProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
