import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trip_break_final/screens/authentication/login_screen.dart';
import 'package:trip_break_final/utils/custom_bottom_navigation_bar.dart';

class SignupScreen2 extends StatefulWidget {
  const SignupScreen2({super.key});

  @override
  State<SignupScreen2> createState() => _SignupScreen2State();
}

class _SignupScreen2State extends State<SignupScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00388C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 200),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Start your travel journey today.',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Create a password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: Icon(
                                  Icons.remove_red_eye_outlined,
                                ),
                                filled: true,
                                fillColor: Color(0xffEBEBEB),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Re-enter password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: Icon(
                                  Icons.remove_red_eye_outlined,
                                ),
                                filled: true,
                                fillColor: Color(0xffEBEBEB),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 68,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) => MainNavigation(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Create account',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff00388C),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(child: Divider()),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Text('Or'),
                              ),
                              Expanded(child: Divider()),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: FaIcon(
                                  FontAwesomeIcons.google,
                                  color: Colors.red,
                                ),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: FaIcon(
                                  FontAwesomeIcons.apple,
                                  color: Colors.black,
                                ),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(fontSize: 13),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (builder) => LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
