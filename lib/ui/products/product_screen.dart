
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
        title: Text('Product List'),
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


















// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../provider/product_provider.dart';
// import '../widgets/product_card.dart';
//
//
// class ProductsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Products')),
//       body: ListView.builder(
//         itemCount: productProvider.products.length,
//         itemBuilder: (context, index) {
//           final product = productProvider.products[index];
//           return ListTile(
//             title: Text(product.name),
//             subtitle: Text(product.description),
//             trailing: Text('\$${product.amount}'),
//           );
//         },
//       ),
//     );
//   }
//
// }
//








//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../provider/product_provider.dart';
// import '../widgets/product_card.dart';
//
//
// class ProductsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Products')),
//       body: FutureBuilder(
//         future: productProvider.fetchProducts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return ListView.builder(
//               itemCount: productProvider.products.length,
//               itemBuilder: (context, index) {
//                 final product = productProvider.products[index];
//                 return ListTile(
//                   title: Text(product.name),
//                   subtitle: Text(product.description),
//                   trailing: Text(product.amount),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//















//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../provider/product_provider.dart';
// import '../widgets/product_card.dart';
//
//
// class ProductsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);
//
//     return FutureBuilder(
//       future: productProvider.fetchProducts(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else {
//           return ListView.builder(
//             itemCount: productProvider.products.length,
//             itemBuilder: (context, index) {
//               return ProductCard(product: productProvider.products[index]);
//             },
//           );
//         }
//       },
//     );
//   }
// }
