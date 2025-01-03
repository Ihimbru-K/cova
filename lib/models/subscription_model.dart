class Subscription {
  final String id;
  final String productId;
  final String productName; 
  final String userId;
  final String subscriptionDate;
  final String startDate;
  final String endDate;
  final String amount;

  Subscription({
    required this.id,
    required this.productId,
    required this.productName, 
    required this.userId,
    required this.subscriptionDate,
    required this.startDate,
    required this.endDate,
    required this.amount,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'],
      productId: json['product_id'],
      productName: json['product_name'], 
      userId: json['user_id'],
      subscriptionDate: json['subscription_date'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'product_name': productName, 
      'user_id': userId,
      'subscription_date': subscriptionDate,
      'start_date': startDate,
      'end_date': endDate,
      'amount': amount,
    };
  }
}



















