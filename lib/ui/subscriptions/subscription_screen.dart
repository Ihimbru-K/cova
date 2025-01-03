import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/subscription_provider.dart';



class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Subscriptions'),
      ),
      body: Consumer<SubscriptionProvider>(
        builder: (context, subscriptionProvider, child) {
          if (subscriptionProvider.subscriptions.isEmpty) {
            subscriptionProvider.fetchSubscriptions();
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: subscriptionProvider.subscriptions.length,
              itemBuilder: (context, index) {
                final subscription = subscriptionProvider.subscriptions[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subscription.productName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Start: ${subscription.startDate.split("T")[0]}',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            Text(
                              'End: ${subscription.endDate.split("T")[0]}',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ), const SizedBox(height: 8),
                        Text(
                          'Amount: ${subscription.amount} FCFA',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}



















