import '../../../../../common_imports.dart';
import '../provider/home_screen_provider.dart';
import 'widgets/bottom_navbar.dart';
import 'widgets/hero_banner.dart';
import 'widgets/home_header.dart';
import 'widgets/popular_section.dart';
import 'widgets/recommended_section.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) {

      context
          .read<HomeProvider>()
          .fetchAllHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: RefreshIndicator(

          onRefresh: () async {

            await context
                .read<HomeProvider>()
                .fetchAllHomeData();
          },

          child: SingleChildScrollView(

            padding: const EdgeInsets.all(16),

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

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
      ),

      bottomNavigationBar:
      const BottomNavbar(),
    );
  }
}

