import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  late String name;
  late String email;
  late String image_url;
  final String? user_type;
  final DateTime? createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image_url,
    required this.user_type,
    required this.createdAt,
  });

  UserModel.register({
    required this.id,
    required this.name,
    required this.email,
    required this.user_type,
    required this.image_url,
    required this.createdAt,
  });

  UserModel.aboutMe({
    required this.id,
    required this.name,
    required this.email,
    required this.image_url,
    this.user_type,
    this.createdAt
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
          print('Error parsing createdAt date: $e');
        }
      }
    }
    
    return UserModel.aboutMe(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      image_url: data['image_url'] ?? '',
      user_type: data['user_type'], // Include user_type
      createdAt: createdAtDate // Include createdAt with proper conversion
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, user_type: $user_type, createdAt: $createdAt)';
  }
}