
// product_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/product_provider.dart';
import '../widgets/product_card.dart';


class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.6,
        centerTitle: true,
        title: const Text('Insurance Products', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.products.isEmpty) {
            productProvider.fetchProducts();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: productProvider.products[index]);
              },
            );
          }
        },
      ),
    );
  }
}


