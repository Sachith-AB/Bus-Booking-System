class Order {
  final String id;
  final String userId;
  final String productId;
  final double quantity;
  final String deliveryAddress;
  final String uniqueId;
  final int deliveryFee;

  Order({
    required this.id,
    required this.userId,
    required this.productId,
    required this.quantity,
    required this.deliveryAddress,
    required this.uniqueId,
    this.deliveryFee = 0,
  });
  // Convert Order instance to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'productId': productId,
      'quantity': quantity,
      'deliveryAddress': deliveryAddress,
      'uniqueId': uniqueId,
      'deliveryFee': deliveryFee,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }

  factory Order.fromSnapshot(dynamic doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Order(
      id: doc.id,
      userId: data['userId'] ?? '',
      productId: data['productId'] ?? '',
      quantity: (data['quantity'] ?? 0).toDouble(),
      deliveryAddress: data['deliveryAddress'] ?? '',
      uniqueId: data['uniqueId'] ?? '',
      deliveryFee: (data['deliveryFee'] ?? 0).toInt(),
    );
  }
}