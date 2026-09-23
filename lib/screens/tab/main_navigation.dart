import 'package:flutter/material.dart';

import 'package:trip_break_final/screens/tab/home_screen.dart';
import 'package:trip_break_final/screens/tab/explore_screen.dart';
import 'package:trip_break_final/screens/tab/my_trip.dart';
import 'package:trip_break_final/screens/tab/profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    ExploreScreen(),
    MyTrip(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectIndex,
        children: screens,
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectIndex,

        onDestinationSelected: (value) {
          setState(() {
            selectIndex = value;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'Explore',
          ),

          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(Icons.calendar_month),
            label: 'My Trips',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}