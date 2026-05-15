import '../../../../../common_imports.dart';
import '../provider/home_screen_provider.dart';
import 'widgets/bottom_navbar.dart';
import 'widgets/hero_banner.dart';
import 'widgets/home_header.dart';
import 'widgets/popular_section.dart';
import 'widgets/recommended_section.dart';
import 'widgets/explore_header.dart';
import 'widgets/explore_categories.dart';
import 'widgets/popular_destinations.dart';
import 'widgets/popular_sites.dart';
import 'widgets/my_trips_header.dart';
import 'widgets/trips_tab_selector.dart';
import 'widgets/filter_chips.dart';
import 'widgets/trip_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().fetchAllHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          return IndexedStack(
            index: provider.currentTabIndex,
            children: [
              // Home Tab (Index 0)
              _buildHomeTab(context),
              
              // Explore Tab (Index 1)
              _buildExploreTab(),

              // My Trips Tab (Index 2)
              _buildMyTripsTab(provider),

              // Profile Tab (Index 3)
              const Center(child: Text("Profile Screen")),
            ],
          );
        },
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }

  Widget _buildHomeTab(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await context.read<HomeProvider>().fetchAllHomeData();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeHeader(),
              SizedBox(height: 20),
              HeroBanner(),
              SizedBox(height: 24),
              PopularSection(),
              SizedBox(height: 24),
              RecommendedSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExploreTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ExploreHeader(),
          ExploreCategories(),
          PopularDestinations(),
          SizedBox(height: 20),
          PopularSites(),
        ],
      ),
    );
  }

  Widget _buildMyTripsTab(HomeProvider provider) {
    return SafeArea(
      child: Column(
        children: [
          const MyTripsHeader(),
          const TripsTabSelector(),
          const FilterChips(),
          Expanded(
            child: provider.isLoadingTrips && 
                   (provider.tripsTabIndex == 0 ? provider.upcomingTrips.isEmpty : provider.wishlistTrips.isEmpty)
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: () async {
                      if (provider.tripsTabIndex == 0) {
                        await provider.fetchTripsData();
                      } else {
                        await provider.fetchWishlistData();
                      }
                    },
                    child: ListView(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      children: [
                        if (provider.tripsTabIndex == 0) ...[
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Text(
                              "Upcoming Trips",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ...provider.upcomingTrips.map((trip) => TripCard(trip: trip)),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Text(
                              "Past Trips",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ...provider.pastTrips.map((trip) => TripCard(trip: trip)),
                        ] else ...[
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Text(
                              "My Wishlist",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ...provider.wishlistTrips.map((trip) => TripCard(trip: trip, isWishlistStyle: true)),
                        ],
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
