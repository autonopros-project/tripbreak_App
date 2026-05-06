class RecommendedModel {

  final String title;
  final String subtitle;
  final String image;
  final String rating;
  final String price;

  RecommendedModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.rating,
    required this.price,
  });

  factory RecommendedModel.fromJson(
      Map<String, dynamic> json) {

    return RecommendedModel(

      title: json['title'] ?? '',

      subtitle: json['subtitle'] ?? '',

      image: json['image'] ?? '',

      rating: json['rating'].toString(),

      price: json['price'].toString(),
    );
  }
}