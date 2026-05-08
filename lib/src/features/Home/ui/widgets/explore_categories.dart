import '../../../../../common_imports.dart';
import '../../provider/home_screen_provider.dart';

class ExploreCategories extends StatelessWidget {
  const ExploreCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        if (provider.isLoadingExplore && provider.exploreCategories.isEmpty) {
          return const SizedBox(
            height: 80,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: provider.exploreCategories.map((category) {
              return InkWell(
                onTap: () {
                  debugPrint("Selected category: ${category.label}");
                },
                child: Column(
                  children: [
                    Icon(category.icon, color: const Color(0xFF1E5894), size: 28),
                    const SizedBox(height: 8),
                    Text(
                      category.label,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
