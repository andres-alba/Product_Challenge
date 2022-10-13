import 'package:flutter/material.dart';
import 'package:products_sandbox/products/ui/controller/product_controller.dart';
import 'package:products_sandbox/services/api.dart';
import 'package:provider/provider.dart';

var categories = [
  'smartphones',
  'laptops',
  'fragrances',
  'skincare',
  'groceries',
  'home-decoration'
];

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
            return Column(mainAxisSize: MainAxisSize.min, children: [
              // const SizedBox(
              //   height: 10,
              // ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CategoryFilterButton(
                        name: categories[index],
                      );
                    }),
              ),
              //const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
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
              ),
            ]);
          },
        ),
      ),
    );
  }
}

class CategoryFilterButton extends StatefulWidget {
  final String name;

  const CategoryFilterButton({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<CategoryFilterButton> createState() => _CategoryFilterButtonState();
}

class _CategoryFilterButtonState extends State<CategoryFilterButton> {
  late bool buttonPressed;

  @override
  Widget build(BuildContext context) {
    var productController = context.watch<ProductController>();
    return ChangeNotifierProvider(
      create: (_) => ProductController(Api())..filterProductsBy(widget.name),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 120,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                textStyle: const TextStyle(
                  fontSize: 15,
                )),
            onPressed: () {
              productController.filterProductsBy(widget.name);
            },
            child: Text(
              widget.name,
              style: const TextStyle(fontSize: 11),
            ),
          ),
        ),
      ),
    );
  }
}
