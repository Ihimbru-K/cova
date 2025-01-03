
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];

  void fetchProducts() async {
    try {
      List<Product> fetchedProducts = await ProductService.fetchProducts();
      products = fetchedProducts;
      notifyListeners();
    } catch (e) {
      print('Error fetching products: $e');
    }
  }
}




























