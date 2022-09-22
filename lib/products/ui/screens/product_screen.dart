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
            return ListView(
              children: productController.allProduct
                  .map((x) => ListTile(
                        title: Column(
                          children: [Text(x.title)],
                        ),
                      ))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
