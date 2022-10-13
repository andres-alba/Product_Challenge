import 'package:flutter/material.dart';
import 'package:products_sandbox/products/ui/controller/product_controller.dart';
import 'package:products_sandbox/services/api.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductController(Api())..retrieveAllProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Builder(
          builder: (ctx) {
            var productController = ctx.watch<ProductController>();
            return SingleChildScrollView(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    CategoryFilterButton(name: 'Phones'),
                    CategoryFilterButton(name: 'Laptops'),
                    CategoryFilterButton(name: 'Fragrances'),
                    CategoryFilterButton(name: 'SkinCare'),
                    CategoryFilterButton(name: 'Groceries'),
                    CategoryFilterButton(name: 'Home'),
                  ],
                ),
                const SizedBox(height: 20),
                GridView.count(
                  physics: const ScrollPhysics(),
                  childAspectRatio: (1 / 1.5),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: productController.allProduct
                      .map(
                        (x) => Card(
                          elevation: 5,
                          child: Container(
                            height: 290,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.network(x.images.first),
                                ),
                                Text(
                                  x.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  x.description,
                                  maxLines: 2,
                                  style: const TextStyle(fontSize: 12),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    x.stock.toString(),
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ]),
            );
          },
        ),
      ),
    );
  }
}

class CategoryFilterButton extends StatelessWidget {
  final String name;
  const CategoryFilterButton({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 65,
        height: 40,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            name,
            style: const TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }
}
