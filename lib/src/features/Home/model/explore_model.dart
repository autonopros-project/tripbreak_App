import '../../../../../common_imports.dart';

class ExploreCategory {
  final String label;
  final IconData icon;

  ExploreCategory({required this.label, required this.icon});

  factory ExploreCategory.fromJson(Map<String, dynamic> json) {
    return ExploreCategory(
      label: json['label'] ?? '',
      icon: _getIconData(json['icon_name']),
    );
  }

  static IconData _getIconData(String? iconName) {
    switch (iconName) {
      case 'flight': return Icons.flight;
      case 'hotel': return Icons.apartment;
      case 'car': return Icons.directions_car;
      case 'package': return Icons.inventory_2;
      case 'fun': return Icons.attractions;
      default: return Icons.help_outline;
    }
  }
}

class Destination {
  final String title;
  final String description;
  final String price;

  Destination({
    required this.title,
    required this.description,
    required this.price,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
    );
  }
}

class PopularSite {
  final String name;
  final String location;
  final String imageUrl;
  final String rating;
  final String price;
  final bool isFavorite;

  PopularSite({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.price,
    this.isFavorite = false,
  });

  factory PopularSite.fromJson(Map<String, dynamic> json) {
    return PopularSite(
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      imageUrl: json['image_url'] ?? '',
      rating: json['rating'] ?? '0.0',
      price: json['price'] ?? '0',
      isFavorite: json['is_favorite'] ?? false,
    );
  }

  PopularSite copyWith({bool? isFavorite}) {
    return PopularSite(
      name: name,
      location: location,
      imageUrl: imageUrl,
      rating: rating,
      price: price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
