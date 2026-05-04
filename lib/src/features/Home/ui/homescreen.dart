import 'package:tripBreak/src/core/core/utils/extension.dart';
import 'package:tripBreak/src/features/Home/ui/registrationFormScreen.dart';

import '../../../../../common_imports.dart';
import '../../../core/core/constants/constants_index.dart';
import '../../../core/core/theme/colors.dart';
import '../../../core/core/theme/style.dart';
import '../../../core/core/utils/routes.dart';
import '../../../core/core/utils/shared_preference.dart';
import '../../login/login_index.dart';
import '../../widgets/custom_icon.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/dotted_divider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
      final provider = Provider.of<LoginProvider>(context, listen: false);
      provider.loadLoginModelFromLocalStorage().then((_) {
        if ((provider.selectedRole == null || provider.selectedRole!.isEmpty) &&
            provider.roles.isNotEmpty) {
          final defaultManagerRole = provider.roles.firstWhere(
                (r) => r.roleCode == 'MNGR',
            orElse: () => provider.roles.first,
          );
          provider.setSelectedRole(defaultManagerRole.roleCode ?? '');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, _) {
        final roles = provider.roles;
        final plants = provider.plants;

        final validSelectedRole = roles.any((r) => r.roleCode == provider.selectedRole)
            ? provider.selectedRole
            : null;
        final validSelectedPlantId = plants.any((p) => p.plantID == provider.selectedPlantId)
            ? provider.selectedPlantId
            : null;

        final selectedRoleName = validSelectedRole != null
            ? roles.firstWhere((r) => r.roleCode == validSelectedRole).roleName
            : 'N/A';
        final selectedPlantName = validSelectedPlantId != null
            ? plants.firstWhere((p) => p.plantID == validSelectedPlantId).plantName
            : 'N/A';

        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: ThemeColors.primaryColor,
              iconTheme: const IconThemeData(color: ThemeColors.whiteColor),
              title: FittedBox(
                child: Column(
                  children: [
                    CustomText(
                      writtenText: Constants.appName,
                      textStyle: ThemeTextStyle.style(color: ThemeColors.whiteColor),
                    ),
                    const SizedBox(width: 8),
                    CustomText(
                      writtenText: '$selectedRoleName',
                      textStyle: ThemeTextStyle.style(fontSize: 14,color: ThemeColors.whiteColor),
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    // CustomText(
                    //   writtenText: '$selectedRoleName',
                    //   textStyle: ThemeTextStyle.style(fontSize: 14,color: ThemeColors.whiteColor),
                    // ),
                    // const SizedBox(width: 8),
                    CustomText(
                      writtenText: '$selectedPlantName',
                      textStyle: ThemeTextStyle.style(fontSize: 14,color: ThemeColors.whiteColor),
                    ),
                  ],
                  ),
                )
              ],
            ),
            drawer: Drawer(
              width: context.width * .7,
              backgroundColor: ThemeColors.whiteColor,
              child: ListView(
                padding: const EdgeInsets.all(12.0),
                children: [
                  // Image.asset(Assets.appLogo, fit: BoxFit.fill),
                  CustomText(
                    writtenText: 'Welcome, ${LocalStorages.getName()}!',
                    textStyle: ThemeTextStyle.style(fontWeight: FontWeight.bold),
                  ),
                  CustomText(
                    writtenText: 'Mobile: ${LocalStorages.getMobileNumber()}',
                    textStyle: ThemeTextStyle.style(),
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    writtenText: 'Username: ${LocalStorages.getName()}',
                    textStyle: ThemeTextStyle.style(),
                  ),
                  const DottedDivider(),
                  ListTile(
                    leading: const CustomIcon(icon: Icons.logout),
                    title: CustomText(
                      writtenText: Constants.logOut,
                      textStyle: ThemeTextStyle.style(),
                    ),
                    onTap: () async {
                      await NavigateRoutes.navigateToLoginScreen(isLogoutTap: true);
                    },
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                ],
              ),

            ),
            floatingActionButton: SpeedDial(
              icon: Icons.menu,
              activeIcon: Icons.close,
              foregroundColor: Colors.white,
              backgroundColor: ThemeColors.primaryColor,
              spacing: 10,
              spaceBetweenChildren: 8,
              children: [
                if (validSelectedRole == 'MNGR')
                  SpeedDialChild(
                    child: const Icon(Icons.assignment, color: Colors.white),
                    backgroundColor: ThemeColors.primaryColor,
                    label: 'Cylinder Registration',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const RegistrationFormScreen()),
                      );
                    },
                  ),
                SpeedDialChild(
                  child: const Icon(Icons.person, color: Colors.white),
                  backgroundColor: ThemeColors.primaryColor,
                  label: 'Role',
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Select Role',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 16),
                              DropdownButtonFormField<String>(
                                value: validSelectedRole,
                                decoration: const InputDecoration(
                                  labelText: 'Role',
                                  border: OutlineInputBorder(),
                                ),
                                items: roles.map((role) {
                                  return DropdownMenuItem<String>(
                                    value: role.roleCode,
                                    child: Text(role.roleName ?? ''),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  if (val != null) {
                                    provider.setSelectedRole(val);
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                SpeedDialChild(
                  child: const Icon(Icons.water, color: Colors.white),
                  backgroundColor: ThemeColors.primaryColor,
                  label: 'Plant',
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Select Plant',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 16),
                              DropdownButtonFormField<String>(
                                value: validSelectedPlantId,
                                decoration: const InputDecoration(
                                  labelText: 'Plant',
                                  border: OutlineInputBorder(),
                                ),
                                items: plants.map((plant) {
                                  return DropdownMenuItem<String>(
                                    value: plant.plantID,
                                    child: Text(plant.plantName.toString()),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  if (val != null) {
                                    provider.setSelectedPlant(val);
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
