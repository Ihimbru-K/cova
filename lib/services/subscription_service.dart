import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/subscription_model.dart';

class SubscriptionService {
  static const String baseUrl = 'https://67665728410f8499965765c3.mockapi.io/insuraease/api/v1';

  static Future<List<Subscription>> fetchSubscriptions() async {
    final response = await http.get(Uri.parse('$baseUrl/Subscriptions'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Subscription.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch subscriptions');
    }
  }

  static Future<Subscription> addSubscription(Subscription subscription) async {
    final response = await http.post(
      Uri.parse('$baseUrl/Subscriptions'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(subscription.toJson()),
    );

    if (response.statusCode == 201) {
      return Subscription.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add subscription');
    }
  }
}



