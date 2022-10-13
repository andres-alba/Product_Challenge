import 'package:flutter_test/flutter_test.dart';
import 'package:products_sandbox/products/domain/product.dart';

void main() {
  late Product sut;
  setUp(() {});

  group("when getting stock friendly name", () {
    test("it should return limited stock when amount is 50 or less", () async {
      sut = Product(stock: 50);

      expect(sut.getStockName(), "Limited stock");
    });

    test("it should return stock when amount is greater than 50", () async {
      sut = Product(stock: 65);
      expect(sut.getStockName(), "${sut.stock}");
    });
  });
}
