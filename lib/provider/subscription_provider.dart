import 'package:flutter/material.dart';

import '../models/subscription_model.dart';
import '../services/subscription_service.dart';

class SubscriptionProvider extends ChangeNotifier {
  List<Subscription> subscriptions = [];

  void fetchSubscriptions() async {
    try {
      subscriptions = await SubscriptionService.fetchSubscriptions();
      notifyListeners();
    } catch (e) {
      print('Error fetching subscriptions: $e');
    }
  }

  void addSubscription(Subscription subscription) async {
    try {
      Subscription newSubscription = await SubscriptionService.addSubscription(subscription);
      subscriptions.add(newSubscription);
      notifyListeners();
    } catch (e) {
      print('Error adding subscription: $e');
    }
  }
}






















// import 'dart:convert';
// import 'package:flutter/material.dart';
//
// import '../models/subscription_model.dart';
//
// class SubscriptionProvider with ChangeNotifier {
//   List<Subscription> _subscriptions = [];
//
//   List<Subscription> get subscriptions => _subscriptions;
//
//   Future<void> fetchSubscriptions() async {
//     try {
//       // Dummy JSON data for subscriptions
//       final String dummyData = '''
//       [
//         {"productId": "productId 1", "userId": "userId 1", "startDate": "2024-12-20T14:19:55.384Z", "endDate": "2024-12-20T12:14:28.967Z", "totalAmount": "192.99", "id": "1"},
//         {"productId": "productId 2", "userId": "userId 2", "startDate": "2024-12-20T22:10:53.537Z", "endDate": "2024-12-20T06:22:24.598Z", "totalAmount": "893.78", "id": "2"},
//         {"productId": "productId 3", "userId": "userId 3", "startDate": "2024-12-21T01:39:48.261Z", "endDate": "2024-12-21T02:22:53.596Z", "totalAmount": "664.63", "id": "3"},
//         {"productId": "productId 4", "userId": "userId 4", "startDate": "2024-12-20T17:18:49.399Z", "endDate": "2024-12-20T17:29:35.873Z", "totalAmount": "779.86", "id": "4"},
//         {"productId": "productId 5", "userId": "userId 5", "startDate": "2024-12-20T08:42:07.059Z", "endDate": "2024-12-20T08:11:37.208Z", "totalAmount": "765.23", "id": "5"}
//       ]
//       ''';
//       final List<dynamic> data = json.decode(dummyData);
//       _subscriptions = data.map((item) => Subscription.fromJson(item)).toList();
//       notifyListeners();
//     } catch (error) {
//       print('Error fetching subscriptions: $error');
//     }
//   }
// }
//
//
//
//
//
//
//
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import '../models/subscription_model.dart';
// //
// // class SubscriptionProvider with ChangeNotifier {
// //   List<Subscription> _subscriptions = [];
// //
// //   List<Subscription> get subscriptions => _subscriptions;
// //
// //   Future<void> fetchSubscriptions() async {
// //     try {
// //       final response = await http.get(Uri.parse('<your-subscriptions-endpoint>'));
// //       if (response.statusCode == 200) {
// //         final List<dynamic> data = json.decode(response.body);
// //         _subscriptions = data.map((item) => Subscription.fromJson(item)).toList();
// //         notifyListeners();
// //       } else {
// //         throw Exception('Failed to fetch subscriptions');
// //       }
// //     } catch (error) {
// //       print('Error fetching subscriptions: $error');
// //     }
// //   }
// // }
// //
//
//
//
//
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// //
// // import '../models/subscription_model.dart';
// // import '../utils/api_endpoints.dart';
// //
// // class SubscriptionProvider with ChangeNotifier {
// //   List<Subscription> _subscriptions = [];
// //
// //   List<Subscription> get subscriptions => _subscriptions;
// //
// //   Future<void> fetchSubscriptions() async {
// //     try {
// //       final response = await http.get(Uri.parse(subscriptionsEndpoint));
// //       if (response.statusCode == 200) {
// //         final List<dynamic> data = json.decode(response.body);
// //         _subscriptions = data.map((item) => Subscription.fromJson(item)).toList();
// //         notifyListeners();
// //       } else {
// //         throw Exception('Failed to load subscriptions');
// //       }
// //     } catch (error) {
// //       rethrow;
// //     }
// //   }
// // }
