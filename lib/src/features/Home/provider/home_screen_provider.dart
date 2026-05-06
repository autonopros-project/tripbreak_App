import '../../../../common_imports.dart';
import '../repository/home_repository.dart';

class HomeProvider extends ChangeNotifier {

  final HomeRepository repository;

  HomeProvider(this.repository);

  bool isLoadingBanner = false;
  bool isLoadingPopular = false;
  bool isLoadingRecommended = false;

  Map<String, dynamic>? headerData;

  List<dynamic> bannerList = [];
  List<dynamic> popularList = [];
  List<dynamic> recommendedList = [];

  Future<void> fetchAllHomeData() async {

    await Future.wait([
      fetchHeaderData(),
      fetchBannerData(),
      fetchPopularPlaces(),
      fetchRecommendedPlaces(),
    ]);
  }

  Future<void> fetchHeaderData() async {

    try {

      final response =
      await repository.getHeaderData();

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

      final response =
      await repository.getBannerData();

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

      final response =
      await repository.getPopularPlaces();

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

      final response =
      await repository.getRecommendedPlaces();

      recommendedList = response['data'] ?? [];

    } catch (e) {

      debugPrint(e.toString());

    } finally {

      isLoadingRecommended = false;
      notifyListeners();
    }
  }

  Future<void> postIMSQInspectDetailsApiCall(HomeProvider homeProvider) async {}
}