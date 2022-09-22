import 'package:flutter/foundation.dart';
import 'package:products_sandbox/products/domain/product.dart';
import 'package:products_sandbox/services/api.dart';

class ProductController extends ChangeNotifier {
  late final List<Product> _allProducts;
  final Api _api;

  ProductController(this._api) {
    _allProducts = [];
  }

  List<Product> get allProduct => _allProducts;

  Future<void> retrieveAllProducts() async {
    var response = (await _api.get(url: "") as Map<String, dynamic>);
    _allProducts = response["products"].map((x) {
      return Product.fromJson(x);
    }).toList();

    notifyListeners();
  }

  void filterProductsBy(String category) {
    notifyListeners();
  }
}
