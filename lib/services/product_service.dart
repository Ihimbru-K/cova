// product_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/product_model.dart';


class ProductService {
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://67665728410f8499965765c3.mockapi.io/insuraease/api/v1/Products'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Product> products = data.map((item) => Product(
        name: item['name'],
        description: item['description'],
        amount: item['amount'],
        id: item['id'],
      )).toList();

      return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}















