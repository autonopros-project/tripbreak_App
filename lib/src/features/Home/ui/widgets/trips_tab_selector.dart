import '../../../../../common_imports.dart';
import '../../provider/home_screen_provider.dart';

class TripsTabSelector extends StatelessWidget {
  const TripsTabSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        return Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.05),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => provider.tripsTabIndex = 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: provider.tripsTabIndex == 0 ? Colors.amber : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.travel_explore,
                          color: provider.tripsTabIndex == 0 ? Colors.black : Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Trips",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: provider.tripsTabIndex == 0 ? Colors.black : Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => provider.tripsTabIndex = 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: provider.tripsTabIndex == 1 ? Colors.amber : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color: provider.tripsTabIndex == 1 ? Colors.black : Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Wishlist",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: provider.tripsTabIndex == 1 ? Colors.black : Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
