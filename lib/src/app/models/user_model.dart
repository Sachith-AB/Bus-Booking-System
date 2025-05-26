import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  late String name;
  late String email;
  late String image_url;
  final String? user_type;
  final DateTime? createdAt;
  late String address;
  late String contact;
  List<dynamic> cart;
  List<dynamic> favourite;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image_url,
    required this.user_type,
    required this.createdAt,
    required this.address,
    required this.contact,
    this.cart = const [],
    this.favourite = const [],
  });

  UserModel.register({
    required this.id,
    required this.name,
    required this.email,
    required this.user_type,
    required this.image_url,
    required this.createdAt,
    required this.address,
    required this.contact,
    this.cart = const [],
    this.favourite = const [],
  });

  UserModel.aboutMe({
    required this.id,
    required this.name,
    required this.email,
    required this.image_url,
    this.user_type,
    this.createdAt,
    required this.address,
    required this.contact,
    this.cart = const [],
    this.favourite = const [],
  });

  // Convert UserModel instance to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image_url': image_url,
      'user_type': user_type,
      'createdAt': createdAt,
      'address': address,
      'contact': contact,
      'cart': cart,
      'favourite': favourite,
    };
  }

  // Create a UserModel instance from a JSON map using aboutMe constructor
  factory UserModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Handle the Timestamp conversion to DateTime
    DateTime? createdAtDate;
    if (data['createdAt'] != null) {
      if (data['createdAt'] is Timestamp) {
        createdAtDate = (data['createdAt'] as Timestamp).toDate();
      } else if (data['createdAt'] is String) {
        try {
          createdAtDate = DateTime.parse(data['createdAt']);
        } catch (e) {
          //print('Error parsing createdAt date: $e');
        }
      }
    }

    return UserModel.aboutMe(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      image_url: data['image_url'] ?? '',
      user_type: data['user_type'],
      createdAt: createdAtDate,
      address: data['address'] ?? '',
      contact: data['contact'] ?? '',
      cart: data['cart'] ?? [],
      favourite: data['favourite'] ?? [],
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, user_type: $user_type,address: $address createdAt: $createdAt,$image_url)';
  }
}
