import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  final String id;
  final String userId;
  final String productId;
  final double quantity;
  final String deliveryAddress;
  final String uniqueId;
  final int deliveryFee;
  String? status;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.userId,
    required this.productId,
    required this.quantity,
    required this.deliveryAddress,
    required this.uniqueId,
    this.deliveryFee = 0,
    this.status,
    required this.createdAt,
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
      'status': status ?? 'pending',
      'createdAt': Timestamp.fromDate(createdAt), // ✅ fix this line
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
      status: data['status'] ?? 'pending',
      createdAt: data['createdAt'] != null
        ? (data['createdAt'] as Timestamp).toDate()
        : DateTime.now(), // Fallback to now or handle accordingly
    );
  }
}