import 'package:flutter/material.dart';
import '../../models/subscription_model.dart';

class SubscriptionCard extends StatelessWidget {
  final Subscription subscription;

  const SubscriptionCard({required this.subscription});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Product ID: ${subscription.productId}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User ID: ${subscription.userId}'),
           // Text('Start Date: ${subscription.startDate.toLocal()}'),
          //  Text('End Date: ${subscription.endDate.toLocal()}'),
          ],
        ),
        trailing: Text('\$${subscription.amount}'),
      ),
    );
  }
}
