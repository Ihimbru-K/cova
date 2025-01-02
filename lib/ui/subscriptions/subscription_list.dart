// import 'package:flutter/material.dart';
//
// import '../../models/subscription_model.dart';
// import '../../services/subscription_service.dart';
//
// class SubscriptionListScreen extends StatefulWidget {
//   const SubscriptionListScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SubscriptionListScreen> createState() => _SubscriptionListScreenState();
// }
//
// class _SubscriptionListScreenState extends State<SubscriptionListScreen> {
//   final SubscriptionService subscriptionService = SubscriptionService('https://mockapi.com/api');
//   late Future<List<Subscription>> subscriptions;
//
//   @override
//   void initState() {
//     super.initState();
//     subscriptions = subscriptionService.fetchSubscriptions();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('My Subscriptions')),
//       body: FutureBuilder<List<Subscription>>(
//         future: subscriptions,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No subscriptions found.'));
//           } else {
//             final subscriptions = snapshot.data!;
//             return ListView.builder(
//               itemCount: subscriptions.length,
//               itemBuilder: (context, index) {
//                 final subscription = subscriptions[index];
//                 return ListTile(
//                   title: Text(subscription.productId), // Replace with product name if available
//                   subtitle: Text('Start: ${subscription.startDate}\nEnd: ${subscription.endDate}'),
//                   trailing: Text('\$${subscription.totalAmount}'),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
