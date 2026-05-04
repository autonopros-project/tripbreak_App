

import 'package:tripBreak/src/core/core/theme/colors.dart';
import 'package:tripBreak/src/core/core/utils/routes.dart';
import 'package:tripBreak/src/core/core/utils/shared_preference.dart';
import 'package:tripBreak/src/features/Home/provider/home_screen_provider.dart';
import 'package:tripBreak/src/features/login/login_index.dart';

import 'common_imports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  await LocalStorages.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        // Add other providers here as needed
      ],
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigateRoutes.navigatorKey,
          theme: ThemeData(
            scaffoldBackgroundColor: ThemeColors.whiteColor,
            popupMenuTheme: const PopupMenuThemeData(
              color: ThemeColors.whiteColor,
              textStyle: TextStyle(color: ThemeColors.blackColor),
            ),
            fontFamily: 'RadioCanada',
          ),
          builder: EasyLoading.init(
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
          ),
          home: const SplashScreen(),  // ✅ FIX: add back your start screen
        ),
      ),
    );
  }
}
