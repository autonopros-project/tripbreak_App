import '../../../../common_imports.dart';
import '../model/booking_model.dart';

class BookingRepository {
  Future<TripDetail> getTripDetail(String tripId) async {
    // Mocking API call
    await Future.delayed(const Duration(seconds: 1));
    return TripDetail(
      id: tripId,
      title: "Swiss Alps Adventure Hike",
      location: "Interlaken, Switzerland",
      rating: 4.9,
      price: "99",
      description: "Embark on an unforgettable 8-day hike through Switzerland's most scenic alpine routes. Experience glacial lakes, charming mountain villages, and stunning panoramic views. Led by local hiking experts.",
      included: [
        "Accommodation",
        "Daily breakfast & dinner",
        "Local hiking guide",
        "Cable car tickets"
      ],
      excluded: [
        "International flights",
        "Travel insurance",
        "Lunch"
      ],
      imageUrl: "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
    );
  }

  Future<List<BookingPlan>> getBookingPlans() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      BookingPlan(
        type: "SAVER",
        price: r"$ 988",
        flight: "Air India",
        stay1: "Standard City Hotel",
        stay2: "Standard City Hotel",
        estLivingCost: r"$520",
      ),
      BookingPlan(
        type: "BALANCED",
        price: r"$ 1636",
        flight: "IndiGo",
        stay1: "Standard City Hotel",
        stay2: "Standard City Hotel",
        estLivingCost: r"$920",
      ),
      BookingPlan(
        type: "LUXURY",
        price: r"$ 3516",
        flight: "Qatar Airways",
        stay1: "Standard City Hotel",
        stay2: "Standard City Hotel",
        estLivingCost: r"$1520",
      ),
    ];
  }

  Future<bool> confirmBooking(BookingData data) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
