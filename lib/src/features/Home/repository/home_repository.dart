import '../../../core/core/network/network_index.dart';
import '../../../core/core/constants/constants_index.dart';

class HomeRepository {

  Future<dynamic> getHeaderData() async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return {

      "name": "Amit Kumar",

      "welcomeText": "Welcome back",
    };
  }

  Future<dynamic> getBannerData() async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return {

      "data": [

        {
          "image":
          "https://images.unsplash.com/photo-1537996194471-e657df975ab4",

          "title":
          "Bali, Indonesia",

          "subtitle":
          "40% Off Summer Escapes",
        },
      ],
    };
  }

  Future<dynamic> getPopularPlaces() async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return {

      "data": [

        {
          "title": "Paris, France",

          "image":
          "https://images.unsplash.com/photo-1502602898657-3e91760cbb34",

          "rating": "4.9",

          "price": "\$400",
        },

        {
          "title":
          "Santorini, Greece",

          "image":
          "https://images.unsplash.com/photo-1613395877344-13d4a8e0d49e",

          "rating": "4.8",

          "price": "\$350",
        },
      ],
    };
  }

  Future<dynamic>
  getRecommendedPlaces() async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return {

      "data": [

        {
          "title":
          "Paris Night Tour",

          "subtitle":
          "Paris, France - 3 hours",

          "image":
          "https://images.unsplash.com/photo-1511739001486-6bfe10ce785f",

          "rating":
          "4.9",

          "price":
          "\$80",
        },

        {
          "title":
          "Tokyo Adventure",

          "subtitle":
          "Tokyo, Japan - 5 hours",

          "image":
          "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf",

          "rating":
          "4.7",

          "price":
          "\$120",
        },
      ],
    };
  }
}

// class HomeRepository {
//
//   Future<dynamic> getHeaderData() async {
//
//     final response = await ApiCalling.callApi(
//       apiUrl: AppUrls.profileData,
//       apiFunType: APITypes.get,
//     );
//
//     return response.body;
//   }
//
//   Future<dynamic> getBannerData() async {
//
//     final response = await ApiCalling.callApi(
//       apiUrl: AppUrls.bannerData,
//       apiFunType: APITypes.get,
//     );
//
//     return response.body;
//   }
//
//   Future<dynamic> getPopularPlaces() async {
//
//     final response = await ApiCalling.callApi(
//       apiUrl: AppUrls.popularPlaces,
//       apiFunType: APITypes.get,
//     );
//
//     return response.body;
//   }
//
//   Future<dynamic> getRecommendedPlaces() async {
//
//     final response = await ApiCalling.callApi(
//       apiUrl: AppUrls.recommendedPlaces,
//       apiFunType: APITypes.get,
//     );
//
//     return response.body;
//   }
// }