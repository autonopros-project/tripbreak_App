import '../../../core/core/network/network_index.dart';
import '../../../core/core/constants/constants_index.dart';

class HomeRepository {
  Future<dynamic> getHeaderData() async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      "name": "Amit Kumar",
      "welcomeText": "Welcome back",
    };
  }

  Future<dynamic> getBannerData() async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      "data": [
        {
          "image": "https://images.unsplash.com/photo-1537996194471-e657df975ab4",
          "title": "Bali, Indonesia",
          "subtitle": "40% Off Summer Escapes",
        },
      ],
    };
  }

  Future<dynamic> getPopularPlaces() async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      "data": [
        {
          "title": "Paris, France",
          "image": "https://images.unsplash.com/photo-1502602898657-3e91760cbb34",
          "rating": "4.9",
          "price": "400",
        },
        {
          "title": "Santorini, Greece",
          "image": "https://images.unsplash.com/photo-1613395877344-13d4a8e0d49e",
          "rating": "4.8",
          "price": "350",
        },
      ],
    };
  }

  Future<dynamic> getRecommendedPlaces() async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      "data": [
        {
          "title": "Paris Night Tour",
          "subtitle": "Paris, France - 3 hours",
          "image": "https://images.unsplash.com/photo-1511739001486-6bfe10ce785f",
          "rating": "4.9",
          "price": "80",
        },
        {
          "title": "Tokyo Adventure",
          "subtitle": "Tokyo, Japan - 5 hours",
          "image": "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf",
          "rating": "4.7",
          "price": "120",
        },
      ],
    };
  }

  // New methods for Explore Screen
  Future<dynamic> getExploreCategories() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return {
      "data": [
        {"label": "Flights", "icon_name": "flight"},
        {"label": "Hotels", "icon_name": "hotel"},
        {"label": "Hire Car", "icon_name": "car"},
        {"label": "Packages", "icon_name": "package"},
        {"label": "Fun", "icon_name": "fun"},
      ]
    };
  }

  Future<dynamic> getExploreDestinations() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return {
      "data": [
        {
          "title": "Cape Town, South Africa",
          "description": "Mountains, oceans, and wildlife adventures",
          "price": "390"
        },
        {
          "title": "Kyoto, Japan",
          "description": "Temples, gardens, and traditional culture",
          "price": "320"
        }
      ]
    };
  }

  Future<dynamic> getPopularSites() async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      "data": [
        {
          "name": "Swiss Alps Resort",
          "location": "Bern, Switzerland",
          "image_url": "https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
          "rating": "4.8",
          "price": "450",
          "is_favorite": false
        },
        {
          "name": "Santorini Villa",
          "location": "Oia, Greece",
          "image_url": "https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
          "rating": "4.9",
          "price": "600",
          "is_favorite": true
        }
      ]
    };
  }

  // New methods for My Trips Screen
  Future<dynamic> getMyTrips() async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      "upcoming": [
        {
          "title": "Bali, Indonesia",
          "location": "7-Day Wellness Retreat",
          "date_range": "Aug 14 - Aug 21, 2025",
          "description": "7-Day Wellness Retreat",
          "image_url": "https://images.unsplash.com/photo-1537996194471-e657df975ab4",
          "status": "Trip starts in 27 days",
          "is_wishlist": true,
        },
        {
          "title": "Alps, Switzerland",
          "location": "Hiking & Glacier Escape",
          "date_range": "Sep 3 - Sep 10, 2025",
          "description": "Hiking & Glacier Escape",
          "image_url": "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
          "status": "Trip starts in 47 days",
          "is_wishlist": true,
        },
        {
          "title": "Marrakech, Morocco",
          "location": "Cultural Adventure",
          "date_range": "Oct 18 - Oct 25, 2025",
          "description": "Cultural Adventure",
          "image_url": "https://images.unsplash.com/photo-1539020140153-e479b8c22e70",
          "status": "Confirmed",
          "is_wishlist": true,
        }
      ],
      "past": [
        {
          "title": "Santorini, Greece",
          "location": "Romantic Island Escape",
          "date_range": "Jun 5 - Jun 12, 2024",
          "description": "Romantic Island Escape",
          "image_url": "https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff",
          "status": "Completed",
          "is_wishlist": true,
        }
      ]
    };
  }

  Future<dynamic> getWishlist() async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      "data": [
        {
          "title": "Swiss Alps Adventure",
          "location": "Interlaken, Switzerland — 8 Days",
          "date_range": "8 Days",
          "description": "Interlaken, Switzerland",
          "image_url": "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
          "rating": "4.8",
          "price": "1,150",
          "status": "Available",
          "is_wishlist": true,
        },
        {
          "title": "Cultural Desert Safari",
          "location": "Marrakech, Morocco — 6 Days",
          "date_range": "6 Days",
          "description": "Marrakech, Morocco",
          "image_url": "https://images.unsplash.com/photo-1539020140153-e479b8c22e70",
          "rating": "4.7",
          "price": "720",
          "status": "Available",
          "is_wishlist": true,
        },
        {
          "title": "Romantic Paris Getaway",
          "location": "Paris, France — 5 Days",
          "date_range": "5 Days",
          "description": "Paris, France",
          "image_url": "https://images.unsplash.com/photo-1502602898657-3e91760cbb34",
          "rating": "4.8",
          "price": "640",
          "status": "Available",
          "is_wishlist": true,
        },
        {
          "title": "Winter Mountain Escape",
          "location": "Banff, Canada — 7 Days",
          "date_range": "7 Days",
          "description": "Banff, Canada",
          "image_url": "https://images.unsplash.com/photo-1517059224940-d4af9eec41b7",
          "rating": "4.6",
          "price": "980",
          "status": "Available",
          "is_wishlist": true,
        }
      ]
    };
  }
}
