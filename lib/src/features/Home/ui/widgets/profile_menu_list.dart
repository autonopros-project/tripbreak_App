import '../../../../../common_imports.dart';
import '../settings_screen.dart';

class ProfileMenuList extends StatelessWidget {
  const ProfileMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Account",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildMenuItem(Icons.business_center_outlined, "My Trips", onTap: () {}),
          _buildMenuItem(Icons.payment_outlined, "Payment Methods", onTap: () {}),
          _buildMenuItem(Icons.description_outlined, "Travel Documents", onTap: () {}),
          _buildMenuItem(Icons.notifications_none_outlined, "Notifications & Alerts", onTap: () {}),
          const SizedBox(height: 20),
          const Text(
            "Other",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildMenuItem(Icons.settings_outlined, "Settings", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            );
          }),
          _buildMenuItem(Icons.help_outline, "Support / Help Center", onTap: () {}),
          _buildMenuItem(Icons.logout, "Logout", onTap: () {}, isLogout: true),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {required VoidCallback onTap, bool isLogout = false}) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: const Color(0xFF1E5894)),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
    );
  }
}
