import 'package:aladia_one/theme_aladia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MaterialApp(
            themeMode: ThemeMode.system, // Set to system-based theme
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.grey,
              scaffoldBackgroundColor:
                  Colors.white, // Light theme scaffold background
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.black),
                bodyMedium: TextStyle(
                    color: Colors.black), // All text black in light theme
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor:
                  Colors.black, // Dark theme scaffold background
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.white),
                bodyMedium: TextStyle(
                    color: Colors.white), // All text white in dark theme
              ),
            ),

            home: const LoginScreen(),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // The image takes flexible space to avoid overflow
              Flexible(
                child: Image.asset(
                  'assets/app_icon.png',
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    'Aladia',
                    style: GoogleFonts.sora(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 5,
                    ),
                  ),
                ),
              ),
            ]
                .animate()
                .tint(
                    color: const Color.fromARGB(255, 223, 159, 11),
                    delay: 300.ms,
                    duration: 1000.ms,
                    curve: const ElasticInCurve())
                .move(duration: 1000.ms),
          ),
        ),
      ),
    );
  }
}
