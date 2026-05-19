import '../../../../../common_imports.dart';
import '../model/profile_model.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkTheme = false;
  bool pushNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF1E5894)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader("Account Settings"),
            _buildSettingItem(Icons.person_outline, "Edit Profile"),
            _buildSettingItem(Icons.lock_outline, "Change Password"),
            _buildSettingItem(Icons.mail_outline, "Email Preferences"),
            
            _buildSectionHeader("App Preferences"),
            _buildSettingItem(Icons.language, "Language"),
            _buildSettingItem(Icons.payments_outlined, "Currency"),
            _buildSwitchItem(Icons.nightlight_round_outlined, "Appearance / Theme", isDarkTheme, (val) {
              setState(() => isDarkTheme = val);
            }),
            _buildSwitchItem(Icons.notifications_none_outlined, "Push Notifications", pushNotifications, (val) {
              setState(() => pushNotifications = val);
            }),

            _buildSectionHeader("Privacy & Security"),
            _buildSettingItem(Icons.location_on_outlined, "Location Access"),
            _buildSettingItem(Icons.vpn_key_outlined, "Two-Factor Authentication"),
            _buildSettingItem(Icons.file_download_outlined, "Download My Data"),
            _buildSettingItem(Icons.person_remove_outlined, "Delete Account"),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF1E5894)),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }

  Widget _buildSwitchItem(IconData icon, String title, bool value, ValueChanged<bool> onChanged) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF1E5894)),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFF1E5894),
      ),
    );
  }
}
