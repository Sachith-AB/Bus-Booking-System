class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final bool isFavorite;
  final String category;
  final String availableStatus;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isFavorite,
    required this.category,
    required this.availableStatus,
  });
  // Convert Product instance to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
      'category': category,
      'availableStatus': availableStatus,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }
}