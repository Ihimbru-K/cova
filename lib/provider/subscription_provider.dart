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

