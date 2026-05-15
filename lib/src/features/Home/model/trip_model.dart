import '../../../../../common_imports.dart';

class TripModel {
  final String title;
  final String location;
  final String dateRange;
  final String description;
  final String imageUrl;
  final String status; // "Trip starts in X days", "Confirmed", "Completed"
  final String? rating;
  final String? price;
  final bool isWishlist;

  TripModel({
    required this.title,
    required this.location,
    required this.dateRange,
    required this.description,
    required this.imageUrl,
    required this.status,
    this.rating,
    this.price,
    this.isWishlist = false,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      dateRange: json['date_range'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image_url'] ?? '',
      status: json['status'] ?? '',
      rating: json['rating'],
      price: json['price'],
      isWishlist: json['is_wishlist'] ?? false,
    );
  }
}
