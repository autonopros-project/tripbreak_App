class BannerModel {

  final String image;
  final String title;
  final String subtitle;

  BannerModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  factory BannerModel.fromJson(
      Map<String, dynamic> json) {

    return BannerModel(

      image: json['image'] ?? '',

      title: json['title'] ?? '',

      subtitle: json['subtitle'] ?? '',
    );
  }
}