class Product {
  final String title;
  final String description;
  final String brand;
  final int stock;
  final List<String> images;

  Product(
      {this.title = "",
      this.description = "",
      this.brand = "",
      this.stock = 0,
      this.images = const []});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        brand: json["brand"] ?? "",
        stock: json["stock"] ?? 0,
        images:
            (json["images"] as List).map((x) => x as String).toList() ?? []);
  }

  String getStockName() {
    if (this.stock <= 50) {
      return "Limited stock";
    }
    return this.stock.toString();
  }
}
