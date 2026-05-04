import 'package:tripBreak/src/core/core/constants/constant_text.dart';
import 'package:tripBreak/src/core/core/theme/theme_index.dart';
import 'package:tripBreak/src/features/widgets/widgets_index.dart';

// For Testing Purpose after api joining we will remove it as for flow
void main() {
  runApp(const TripBreakApp());
}

class TripBreakApp extends StatelessWidget {
  const TripBreakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const blue = ThemeColors.primaryColor;
    const yellow = ThemeColors.yellowColor;

    return Scaffold(
      backgroundColor: blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(),

              //Title
              const Text(
                Constants.appName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 80),

              // Tag
              Text(
                Constants.guideTitle,
                style: TextStyle(
                  color: yellow,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // Description
              const Text(
                Constants.guideSubTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 60),

              // Button
              SizedBox(
                width: double.infinity,
                child: SubmitButtonFillWidget(
                  text: Constants.getStarted,
                  btnColor: yellow,
                  textColor: blue,
                  borderRadius: 30,
                  textPadding: const EdgeInsets.symmetric(vertical: 16),
                  onTap: () {
                    // navigation to next guide menu
                  },
                  isEnabled: true,
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}