import '../../../../common_imports.dart';
import '../model/explore_model.dart';
import '../model/trip_model.dart';
import '../repository/home_repository.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepository repository;

  HomeProvider(this.repository);

  int _currentTabIndex = 0;
  int get currentTabIndex => _currentTabIndex;

  set currentTabIndex(int index) {
    _currentTabIndex = index;
    if (_currentTabIndex == 1 && exploreCategories.isEmpty) {
      fetchExploreData();
    } else if (_currentTabIndex == 2 && upcomingTrips.isEmpty) {
      fetchTripsData();
    }
    notifyListeners();
  }

  // Trips Tab State (Trips = 0, Wishlist = 1)
  int _tripsTabIndex = 0;
  int get tripsTabIndex => _tripsTabIndex;
  set tripsTabIndex(int index) {
    _tripsTabIndex = index;
    if (_tripsTabIndex == 1 && wishlistTrips.isEmpty) {
      fetchWishlistData();
    }
    notifyListeners();
  }

  // Home Screen States
  bool isLoadingBanner = false;
  bool isLoadingPopular = false;
  bool isLoadingRecommended = false;

  Map<String, dynamic>? headerData;
  List<dynamic> bannerList = [];
  List<dynamic> popularList = [];
  List<dynamic> recommendedList = [];

  // Explore Screen States
  bool isLoadingExplore = false;
  List<ExploreCategory> exploreCategories = [];
  List<Destination> exploreDestinations = [];
  List<PopularSite> popularSites = [];

  // My Trips Screen States
  bool isLoadingTrips = false;
  List<TripModel> upcomingTrips = [];
  List<TripModel> pastTrips = [];
  List<TripModel> wishlistTrips = [];

  Future<void> fetchAllHomeData() async {
    await Future.wait([
      fetchHeaderData(),
      fetchBannerData(),
      fetchPopularPlaces(),
      fetchRecommendedPlaces(),
    ]);
  }

  Future<void> fetchExploreData() async {
    try {
      isLoadingExplore = true;
      notifyListeners();

      final results = await Future.wait([
        repository.getExploreCategories(),
        repository.getExploreDestinations(),
        repository.getPopularSites(),
      ]);

      exploreCategories = (results[0]['data'] as List)
          .map((item) => ExploreCategory.fromJson(item))
          .toList();

      exploreDestinations = (results[1]['data'] as List)
          .map((item) => Destination.fromJson(item))
          .toList();

      popularSites = (results[2]['data'] as List)
          .map((item) => PopularSite.fromJson(item))
          .toList();
    } catch (e) {
      debugPrint("Error fetching explore data: $e");
    } finally {
      isLoadingExplore = false;
      notifyListeners();
    }
  }

  Future<void> fetchTripsData() async {
    try {
      isLoadingTrips = true;
      notifyListeners();

      final response = await repository.getMyTrips();
      
      upcomingTrips = (response['upcoming'] as List)
          .map((item) => TripModel.fromJson(item))
          .toList();
          
      pastTrips = (response['past'] as List)
          .map((item) => TripModel.fromJson(item))
          .toList();
    } catch (e) {
      debugPrint("Error fetching trips: $e");
    } finally {
      isLoadingTrips = false;
      notifyListeners();
    }
  }

  Future<void> fetchWishlistData() async {
    try {
      isLoadingTrips = true;
      notifyListeners();

      final response = await repository.getWishlist();
      wishlistTrips = (response['data'] as List)
          .map((item) => TripModel.fromJson(item))
          .toList();
    } catch (e) {
      debugPrint("Error fetching wishlist: $e");
    } finally {
      isLoadingTrips = false;
      notifyListeners();
    }
  }

  Future<void> fetchHeaderData() async {
    try {
      final response = await repository.getHeaderData();
      headerData = response;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchBannerData() async {
    try {
      isLoadingBanner = true;
      notifyListeners();
      final response = await repository.getBannerData();
      bannerList = response['data'] ?? [];
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoadingBanner = false;
      notifyListeners();
    }
  }

  Future<void> fetchPopularPlaces() async {
    try {
      isLoadingPopular = true;
      notifyListeners();
      final response = await repository.getPopularPlaces();
      popularList = response['data'] ?? [];
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoadingPopular = false;
      notifyListeners();
    }
  }

  Future<void> fetchRecommendedPlaces() async {
    try {
      isLoadingRecommended = true;
      notifyListeners();
      final response = await repository.getRecommendedPlaces();
      recommendedList = response['data'] ?? [];
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoadingRecommended = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavoriteSite(int index) async {
    final currentSite = popularSites[index];
    popularSites[index] = currentSite.copyWith(isFavorite: !currentSite.isFavorite);
    notifyListeners();
  }

  Future<void> postIMSQInspectDetailsApiCall(HomeProvider homeProvider) async {
    notifyListeners();
  }
}
