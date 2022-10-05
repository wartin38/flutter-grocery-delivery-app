import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_store/models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final allProducts = <ProductModel>[];

  Future<List<ProductModel>> getAllProducts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final data =
        await rootBundle.loadString('assets/sample_data/sample_products.json');
    final Map<String, dynamic> json = jsonDecode(data);
    if (json["products"] != null) {
      json["products"].forEach((item) {
        allProducts.add(ProductModel.fromJson(item));
      });
      return allProducts;
    } else {
      return [];
    }
  }
}
