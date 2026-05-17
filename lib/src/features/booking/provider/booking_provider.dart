import '../../../../common_imports.dart';
import '../model/booking_model.dart';
import '../repository/booking_repository.dart';

class BookingProvider extends ChangeNotifier {
  final BookingRepository repository;

  BookingProvider(this.repository);

  bool isLoading = false;
  TripDetail? tripDetail;
  List<BookingPlan> plans = [];
  BookingData bookingData = BookingData();

  Future<void> fetchTripDetail(String tripId) async {
    try {
      isLoading = true;
      notifyListeners();
      tripDetail = await repository.getTripDetail(tripId);
      plans = await repository.getBookingPlans();
    } catch (e) {
      debugPrint("Error fetching trip detail: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void updateDates(DateTime? from, DateTime? to) {
    bookingData.fromDate = from;
    bookingData.toDate = to;
    notifyListeners();
  }

  void updateTravelers(int adults, int children) {
    bookingData.adults = adults;
    bookingData.children = children;
    notifyListeners();
  }

  void updateBudget(double budget) {
    bookingData.budget = budget;
    notifyListeners();
  }

  void selectPlan(BookingPlan plan) {
    bookingData.selectedPlan = plan;
    notifyListeners();
  }

  void updatePaymentInfo({
    String? cardNumber,
    String? expiryDate,
    String? cvv,
    String? cardholderName,
    String? cardType,
  }) {
    if (cardNumber != null) bookingData.cardNumber = cardNumber;
    if (expiryDate != null) bookingData.expiryDate = expiryDate;
    if (cvv != null) bookingData.cvv = cvv;
    if (cardholderName != null) bookingData.cardholderName = cardholderName;
    if (cardType != null) bookingData.cardType = cardType;
    notifyListeners();
  }

  Future<bool> confirmBooking() async {
    try {
      isLoading = true;
      notifyListeners();
      return await repository.confirmBooking(bookingData);
    } catch (e) {
      debugPrint("Error confirming booking: $e");
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
