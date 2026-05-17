import '../../../../../common_imports.dart';

class TripDetail {
  final String id;
  final String title;
  final String location;
  final double rating;
  final String price;
  final String description;
  final List<String> included;
  final List<String> excluded;
  final String imageUrl;

  TripDetail({
    required this.id,
    required this.title,
    required this.location,
    required this.rating,
    required this.price,
    required this.description,
    required this.included,
    required this.excluded,
    required this.imageUrl,
  });

  factory TripDetail.fromJson(Map<String, dynamic> json) {
    return TripDetail(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      price: json['price'] ?? '',
      description: json['description'] ?? '',
      included: List<String>.from(json['included'] ?? []),
      excluded: List<String>.from(json['excluded'] ?? []),
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}

class BookingPlan {
  final String type; // SAVER, BALANCED, LUXURY
  final String price;
  final String flight;
  final String stay1;
  final String stay2;
  final String estLivingCost;

  BookingPlan({
    required this.type,
    required this.price,
    required this.flight,
    required this.stay1,
    required this.stay2,
    required this.estLivingCost,
  });

  factory BookingPlan.fromJson(Map<String, dynamic> json) {
    return BookingPlan(
      type: json['type'] ?? '',
      price: json['price'] ?? '',
      flight: json['flight'] ?? '',
      stay1: json['stay1'] ?? '',
      stay2: json['stay2'] ?? '',
      estLivingCost: json['estLivingCost'] ?? '',
    );
  }
}

class BookingData {
  DateTime? fromDate;
  DateTime? toDate;
  int adults = 1;
  int children = 0;
  double budget = 500.0;
  BookingPlan? selectedPlan;
  String? cardNumber;
  String? expiryDate;
  String? cvv;
  String? cardholderName;
  String? cardType;

  double get totalPrice {
    if (selectedPlan == null) return 0;
    String cleanPrice = selectedPlan!.price.replaceAll(r'$', '').replaceAll(',', '').trim();
    return double.tryParse(cleanPrice) ?? 0;
  }
}
