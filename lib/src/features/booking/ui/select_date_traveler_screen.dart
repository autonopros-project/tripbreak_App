import '../../../../common_imports.dart';
import '../provider/booking_provider.dart';
import 'select_plan_screen.dart';

class SelectDateTravelerScreen extends StatefulWidget {
  const SelectDateTravelerScreen({super.key});

  @override
  State<SelectDateTravelerScreen> createState() => _SelectDateTravelerScreenState();
}

class _SelectDateTravelerScreenState extends State<SelectDateTravelerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Dates & Travelers"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<BookingProvider>(
        builder: (context, provider, _) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Selected Dates",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 15),
                _buildDateSelector(
                  icon: Icons.calendar_today,
                  label: "From",
                  value: provider.bookingData.fromDate != null
                      ? "${provider.bookingData.fromDate!.day}/${provider.bookingData.fromDate!.month}/${provider.bookingData.fromDate!.year}"
                      : "Select Date",
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (date != null) provider.updateDates(date, provider.bookingData.toDate);
                  },
                ),
                const SizedBox(height: 10),
                _buildDateSelector(
                  icon: Icons.calendar_today,
                  label: "To",
                  value: provider.bookingData.toDate != null
                      ? "${provider.bookingData.toDate!.day}/${provider.bookingData.toDate!.month}/${provider.bookingData.toDate!.year}"
                      : "Select Date",
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: provider.bookingData.fromDate ?? DateTime.now(),
                      firstDate: provider.bookingData.fromDate ?? DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (date != null) provider.updateDates(provider.bookingData.fromDate, date);
                  },
                ),
                const SizedBox(height: 30),
                const Text(
                  "Travelers",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 15),
                _buildTravelerCounter(
                  label: "Adult",
                  count: provider.bookingData.adults,
                  onDecrement: () => provider.updateTravelers(
                    (provider.bookingData.adults - 1).clamp(1, 10),
                    provider.bookingData.children,
                  ),
                  onIncrement: () => provider.updateTravelers(
                    (provider.bookingData.adults + 1).clamp(1, 10),
                    provider.bookingData.children,
                  ),
                ),
                const SizedBox(height: 10),
                _buildTravelerCounter(
                  label: "Children",
                  count: provider.bookingData.children,
                  onDecrement: () => provider.updateTravelers(
                    provider.bookingData.adults,
                    (provider.bookingData.children - 1).clamp(0, 10),
                  ),
                  onIncrement: () => provider.updateTravelers(
                    provider.bookingData.adults,
                    (provider.bookingData.children + 1).clamp(0, 10),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Budget",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "\$${provider.bookingData.budget.toInt()}",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                Slider(
                  value: provider.bookingData.budget,
                  min: 100,
                  max: 5000,
                  divisions: 49,
                  activeColor: Colors.amber,
                  onChanged: (val) => provider.updateBudget(val),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SelectPlanScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD700),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDateSelector({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF1E5894), size: 20),
            const SizedBox(width: 12),
            Text(label, style: const TextStyle(color: Colors.grey)),
            const Spacer(),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
            const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildTravelerCounter({
    required String label,
    required int count,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          const Spacer(),
          IconButton(
            onPressed: onDecrement,
            icon: const Icon(Icons.remove_circle_outline, color: Color(0xFF1E5894)),
          ),
          Text("$count", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          IconButton(
            onPressed: onIncrement,
            icon: const Icon(Icons.add_circle_outline, color: Color(0xFF1E5894)),
          ),
        ],
      ),
    );
  }
}
