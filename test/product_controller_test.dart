import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:products_sandbox/products/ui/controller/product_controller.dart';
import 'package:products_sandbox/services/api.dart';

class MockApi extends Mock implements Api {}

void main() {
  late ProductController sut;
  late Api _api;

  setUp(() {
    _api = MockApi();
    sut = ProductController(_api);
  });

  group("when getting all products", () {
    test("it should transform and update allProducts", () async {
      when(_api.get(url: anyNamed("url"))).thenAnswer((x) async => {
            "products": [
              {
                'title': '',
                'brand': '',
                'images': [],
              }
            ]
          });
      await sut.retrieveAllProducts();
      expect(sut.allProduct.length, 1);
    });

    test("It should return selected category products", () async {
      when(_api.get(url: anyNamed("url"))).thenAnswer((x) async => {
            "products": [
              {'category': 'laptops'}
            ]
          });
      sut.filterProductsBy("laptops");
      expect(sut.allProduct.length, 5);
    });
  });
}
