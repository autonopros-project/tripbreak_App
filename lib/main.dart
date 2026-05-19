import 'package:tripBreak/src/core/core/theme/colors.dart';
import 'package:tripBreak/src/core/core/utils/routes.dart';
import 'package:tripBreak/src/core/core/utils/shared_preference.dart';
import 'package:tripBreak/src/features/Home/provider/home_screen_provider.dart';
import 'package:tripBreak/src/features/Home/repository/home_repository.dart';
import 'package:tripBreak/src/features/Home/ui/homescreen.dart';
import 'package:tripBreak/src/features/booking/provider/booking_provider.dart';
import 'package:tripBreak/src/features/booking/repository/booking_repository.dart';
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
        ChangeNotifierProvider(create: (_) => HomeProvider(HomeRepository())),
        ChangeNotifierProvider(create: (_) => BookingProvider(BookingRepository())),
      ],
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigateRoutes.navigatorKey,
          theme: ThemeData(
            scaffoldBackgroundColor: ThemeColors.whiteColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
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
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
