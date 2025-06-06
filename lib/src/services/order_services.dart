import 'package:cloud_firestore/cloud_firestore.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getOrderById(String uniqueId) async {
    try {
      final snapshot = await _firestore
          .collection('Orders')
          .where('uniqueId', isEqualTo: uniqueId)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first.data();
      }
    } catch (e) {
      print('Error fetching order: $e');
    }
    return null;
  }
}
