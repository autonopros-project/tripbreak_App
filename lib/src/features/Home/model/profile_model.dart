import '../../../../../common_imports.dart';

class UserProfile {
  final String name;
  final String email;
  final String avatarUrl;
  final int countriesVisited;
  final int totalTrips;
  final int flightsBooked;

  UserProfile({
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.countriesVisited,
    required this.totalTrips,
    required this.flightsBooked,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
      countriesVisited: json['countries_visited'] ?? 0,
      totalTrips: json['total_trips'] ?? 0,
      flightsBooked: json['flights_booked'] ?? 0,
    );
  }
}

class SettingsItem {
  final String title;
  final IconData icon;
  final bool hasSwitch;
  final bool switchValue;

  SettingsItem({
    required this.title,
    required this.icon,
    this.hasSwitch = false,
    this.switchValue = false,
  });
}
