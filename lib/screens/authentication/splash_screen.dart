import 'package:flutter/material.dart';
import 'package:trip_break_final/screens/authentication/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00388C),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              Text(
                'TRIP BREAK',
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Plan. ',
                    style: TextStyle(fontSize: 36, color: Colors.yellowAccent),
                  ),
                  Text(
                    'Book. ',
                    style: TextStyle(fontSize: 36, color: Colors.white),
                  ),
                  Text(
                    'Explore. ',
                    style: TextStyle(fontSize: 36, color: Colors.yellowAccent),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your journey to unforgettable destinations starts here.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'JockeyOne',
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 378,
                height: 68,
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (builder) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellowAccent,
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 20, color: Color(0xff00388C)),
                  ),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
