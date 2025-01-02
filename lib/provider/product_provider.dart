// product_provider.dart
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



























// import 'dart:convert';
// import 'package:flutter/material.dart';
// import '../models/product_model.dart';
//
// class ProductProvider with ChangeNotifier {
//   List<Product> _products = [];
//
//   List<Product> get products => _products;
//
//   Future<void> fetchProducts() async {
//     try {
//       // Dummy JSON data for products
//       final String dummyData = '''
//       [
//         {"name": "Oriental Concrete Gloves", "description": "Director", "amount": "875.20", "id": "1"},
//         {"name": "Fantastic Metal Chips", "description": "Yvonne", "amount": "459.92", "id": "2"},
//         {"name": "Electronic Bronze Keyboard", "description": "Bhutan", "amount": "868.56", "id": "3"},
//         {"name": "Ergonomic Soft Cheese", "description": "Intersex", "amount": "235.72", "id": "4"},
//         {"name": "Practical Soft Computer", "description": "payment", "amount": "619.50", "id": "5"},
//         {"name": "Tasty Concrete Towels", "description": "record", "amount": "107.24", "id": "6"}
//       ]
//       ''';
//       final List<dynamic> data = json.decode(dummyData);
//       _products = data.map((item) => Product.fromJson(item)).toList();
//       notifyListeners();
//     } catch (error) {
//       print('Error fetching products: $error');
//     }
//   }
// }
//
//
//
//






//
//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product_model.dart';
//
// class ProductProvider with ChangeNotifier {
//   List<Product> _products = [];
//
//   List<Product> get products => _products;
//
//   Future<void> fetchProducts() async {
//     try {
//       final response = await http.get(Uri.parse('<your-products-endpoint>'));
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         _products = data.map((item) => Product.fromJson(item)).toList();
//         notifyListeners();
//       } else {
//         throw Exception('Failed to fetch products');
//       }
//     } catch (error) {
//       print('Error fetching products: $error');
//     }
//   }
// }
//
//
//
//








// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../models/product_model.dart';
// import '../utils/api_endpoints.dart';
//
// class ProductProvider with ChangeNotifier {
//   List<Product> _products = [];
//
//   List<Product> get products => _products;
//
//   Future<void> fetchProducts() async {
//     try {
//       final response = await http.get(Uri.parse(productsEndpoint));
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         _products = data.map((item) => Product.fromJson(item)).toList();
//         notifyListeners();
//       } else {
//         throw Exception('Failed to load products');
//       }
//     } catch (error) {
//       rethrow;
//     }
//   }
// }
