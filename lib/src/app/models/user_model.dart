import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  late String name;
  late String email;
  late String image_url;
  late String user_type;
  late DateTime createdAt;

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
    required this.user_type,
    required this.image_url
});

  // Convert UserModel instance to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image_url': image_url,
      'user_type': user_type,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create a UserModel instance from a JSON map
  factory UserModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String , dynamic>;
    return UserModel.aboutMe(
      id:data['id'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      image_url: data['image_url'] ?? '',
      user_type: data['user_type'] ?? '',
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email)';
  }
}
