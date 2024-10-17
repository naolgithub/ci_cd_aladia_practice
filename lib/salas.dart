import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aladia Login',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const Welcome(),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: double.infinity, // Full width
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.transparent, // Matches #fff0 for transparency
                Colors.transparent, // Matches #fff0
                Colors.white38, // Matches #fff6
                Colors.transparent, // Matches #fff0
                Colors.transparent, // Matches #fff0
                Colors.white, // Matches #fff
                Colors.transparent, // Matches #fff0
                Colors.white, // Matches #fff
              ],
              stops: [
                0.0833,
                0.2743,
                0.3785,
                0.5391,
                0.6215,
                0.6823,
                0.9167
              ], // Adjust these based on your design
            ),
          ),
          padding: const EdgeInsets.all(10), // Add padding around the container
          child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
            crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
            children: [
              // Logo Image
              Image.asset(
                'assets/app_icon.png',
                width: 100, // Adjust size as per the design
                height: 100,
              ),
              const SizedBox(width: 20), // Space between logo and text

              // Text Column
              const Expanded(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center items in the column
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align text to the left
                  children: [
                    Text(
                      'Welcome to Aladia,',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // Space between lines of text
                    Text(
                      'Create or access your account from here',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
