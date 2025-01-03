import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../models/subscription_model.dart';
import '../../provider/subscription_provider.dart';


class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.shopping_cart, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    product.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '${product.amount} FCFA',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final subscriptionProvider =
                Provider.of<SubscriptionProvider>(context, listen: false);
                subscriptionProvider.addSubscription(
                  Subscription(
                    id: '', // MockAPI auto-generates
                    productId: product.id,
                    productName: product.name, 
                    userId: '1', // Mock user ID
                    subscriptionDate: DateTime.now().toIso8601String(),
                    startDate: DateTime.now().toIso8601String(),
                    endDate:
                    DateTime.now().add(Duration(days: 365)).toIso8601String(),
                    amount: product.amount,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Subscribe', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
















//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../models/product_model.dart';
// import '../../models/subscription_model.dart';
// import '../../provider/subscription_provider.dart';
//
// class ProductCard extends StatelessWidget {
//   final Product product;
//
//   const ProductCard({required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       margin: EdgeInsets.all(8),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: ListTile(
//         contentPadding: EdgeInsets.all(16),
//         leading: CircleAvatar(
//           backgroundColor: Colors.blue,
//           child: Icon(Icons.shopping_bag, color: Colors.white),
//         ),
//         title: Text(
//           product.name,
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(
//           product.description,
//           style: TextStyle(fontSize: 14),
//         ),
//         trailing: TextButton(
//           onPressed: () {
//             final subscriptionProvider = Provider.of<SubscriptionProvider>(context, listen: false);
//             subscriptionProvider.addSubscription(
//               Subscription(
//                 id: '', // MockAPI auto-generates this
//                 productId: product.id,
//                 userId: '1', // Static user ID for now
//                 subscriptionDate: DateTime.now().toIso8601String(),
//                 startDate: DateTime.now().toIso8601String(),
//                 endDate: DateTime.now().add(Duration(days: 365)).toIso8601String(),
//                 amount: product.amount,
//               ),
//             );
//           },
//           child: Text('Subscribe'),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // // product_card.dart
// // import 'package:flutter/material.dart';
// //
// // import '../../models/product_model.dart';
// //
// //
// // class ProductCard extends StatelessWidget {
// //   final Product product;
// //
// //   const ProductCard({required this.product});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 4,
// //       margin: EdgeInsets.all(8),
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(12),
// //       ),
// //       child: ListTile(
// //         contentPadding: EdgeInsets.all(16),
// //         leading: CircleAvatar(
// //           backgroundColor: Colors.blue,
// //           child: Icon(Icons.shopping_bag, color: Colors.white),
// //         ),
// //         title: Text(
// //           product.name,
// //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //         ),
// //         subtitle: Text(
// //           product.description,
// //           style: TextStyle(fontSize: 14),
// //         ),
// //         trailing: Text(
// //           '\$${product.amount}',
// //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'package:flutter/material.dart';
// //
// // import '../../models/product_model.dart';
// //
// //
// // class ProductCard extends StatelessWidget {
// //   final Product product;
// //
// //   const ProductCard({required this.product});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       child: ListTile(
// //         title: Text(product.name),
// //         subtitle: Text(product.description),
// //         trailing: Text('\$${product.amount}'),
// //       ),
// //     );
// //   }
// // }
