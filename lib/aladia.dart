import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  // const bool isDevelopment = bool.fromEnvironment('dart.vm.product') == false;
  // if (isDevelopment) {
  //   runApp(const WidgetbookApp());
  // } else {
  //   runApp(const MyApp());
  // }
  runApp(const MyApp());
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
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    const String apiUrl = 'https://dev-api.aladia.io/v2/auth/login';
    String emailValue = "mobile@aladia.io";
    String passwordValue = "Pass@123";
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': emailValue,
        'password': passwordValue,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final String accessToken = data['accessToken'];
      // Handle the token and navigate to the next screen
      log('Login successful, token: $accessToken');
    } else {
      log('Login failed: ${response.body}');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: const Color.fromARGB(255, 212, 210, 210),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 15,
                        left: 15,
                        child: CustomPaint(
                          size: const Size(270, 140),
                          painter: WideDiagonalBarPainter(),
                        ),
                      ),
                      Positioned(
                        // top: 15,
                        left: 75,
                        child: CustomPaint(
                          size: const Size(271, 140),
                          painter: SmallDiagonalBarPainter(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.asset(
                          'assets/aladia_home_icon.png',
                          scale: 2,
                        ),
                      ),
                      const Positioned(
                        left: 170,
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome to Aladia,',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Create or access your ',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'account from here',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enter your email',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    labelText: 'E-mail',
                    filled: true,
                    fillColor: const Color.fromRGBO(158, 158, 158, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: isLoading ? null : login,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 0,
                      ),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.black)
                        : const Text(
                            'Enter',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2.5,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Or',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                    ),
                    Expanded(
                      child: Container(
                        height: 2.5,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black, Colors.transparent],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: SignInButton(
                    imagePath: 'assets/google.png',
                    text: 'Sign in with Google',
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {
                      // Implement Google sign-in logic here
                    },
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: SignInButton(
                    imagePath: 'assets/facebook.png',
                    text: 'Sign in with Facebook',
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {
                      // Implement Facebook sign-in logic here
                    },
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: SignInButton(
                    imagePath: 'assets/apple.png',
                    text: 'Sign in with Apple',
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {
                      // Implement Apple sign-in logic here
                    },
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    // Navigate to Terms & Conditions
                  },
                  child: const Text(
                    'Terms & conditions',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const SignInButton({
    super.key,
    required this.imagePath,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Image.asset(
        imagePath,
        width: 24,
        height: 24,
        fit: BoxFit.cover,
      ),
      label: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(280, 50),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0,
        side: const BorderSide(color: Colors.grey),
      ),
    );
  }
}

class WideDiagonalBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the paint style
    final paint = Paint()
      ..color = const Color.fromARGB(255, 232, 228, 228)
      ..strokeWidth = 40.0
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke;

    // Draw the diagonal line from top left to bottom right
    canvas.drawLine(
      const Offset(0, 0), // Start at the top-left corner
      Offset(size.width, size.height), // End at the bottom-right corner
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SmallDiagonalBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the paint style
    final paint = Paint()
      ..color = const Color.fromARGB(255, 197, 194, 194)
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke;

    // Draw the diagonal line from top left to bottom right
    canvas.drawLine(
      const Offset(0, 0), // Start at the top-left corner
      Offset(size.width, size.height), // End at the bottom-right corner
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
