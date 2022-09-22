import 'package:flutter_test/flutter_test.dart';
import 'package:products_sandbox/products/domain/product.dart';

void main() {
  late Product sut;
  setUp(() {
    sut = Product();
  });

  group("when getting stock friendly name", () {
    test("it should return limited stock when amount is 50 or less", () async {
      expect(sut.getStockName(), "Limited stock");
    });

    test("it should return stock when amount is greater than 50", () async {
      expect(sut.getStockName(), "${sut.stock}");
    });
  });
}
