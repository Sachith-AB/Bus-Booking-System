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
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      image_url: json['image_url'] ?? '',
      user_type: json['user_type'] ?? '',
      createdAt: DateTime.parse(json['createdAt'])
    );
  }
}
