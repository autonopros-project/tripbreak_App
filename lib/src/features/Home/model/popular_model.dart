class PopularModel {

  final String title;
  final String image;
  final String rating;
  final String price;

  PopularModel({
    required this.title,
    required this.image,
    required this.rating,
    required this.price,
  });

  factory PopularModel.fromJson(
      Map<String, dynamic> json) {

    return PopularModel(

      title: json['title'] ?? '',

      image: json['image'] ?? '',

      rating: json['rating'].toString(),

      price: json['price'].toString(),
    );
  }
}