// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Aladia Login',
//       themeMode: ThemeMode.system, // Set to system-based theme
//       theme: ThemeData(
//         brightness: Brightness.light,
//         primarySwatch: Colors.grey,
//         scaffoldBackgroundColor:
//             Colors.white, // Light theme scaffold background
//         textTheme: const TextTheme(
//           bodyLarge: TextStyle(color: Colors.black),
//           bodyMedium:
//               TextStyle(color: Colors.black), // All text black in light theme
//         ),
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//         scaffoldBackgroundColor: Colors.black, // Dark theme scaffold background
//         textTheme: const TextTheme(
//           bodyLarge: TextStyle(color: Colors.white),
//           bodyMedium:
//               TextStyle(color: Colors.white), // All text white in dark theme
//         ),
//       ),
//       home: const LoginScreen(),
//     );
//   }
// }

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Splash Screen',
//           style: Theme.of(context)
//               .textTheme
//               .bodyLarge, // Text color adapts to theme
//         ),
//       ),
//     );
//   }
// }

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool isLoading = false;

//   Future<void> login() async {
//     setState(() {
//       isLoading = true;
//     });

//     const String apiUrl = 'https://dev-api.aladia.io/v2/auth/login';
//     String emailValue = "mobile@aladia.io";
//     String passwordValue = "Pass@123";
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'email': emailValue,
//         'password': passwordValue,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final String accessToken = data['accessToken'];
//       log('Login successful, token: $accessToken');
//     } else {
//       log('Login failed: ${response.body}');
//     }

//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   height: 150,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).scaffoldBackgroundColor,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       width: 2,
//                       color: const Color.fromARGB(255, 212, 210, 210),
//                     ),
//                   ),
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         top: 15,
//                         left: 15,
//                         child: CustomPaint(
//                           size: const Size(270, 140),
//                           painter: WideDiagonalBarPainter(),
//                         ),
//                       ),
//                       Positioned(
//                         left: 75,
//                         child: CustomPaint(
//                           size: const Size(271, 140),
//                           painter: SmallDiagonalBarPainter(),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8.0),
//                         child: Image.asset(
//                           'assets/aladia_home_icon.png',
//                           scale: 2,
//                         ),
//                       ),
//                       const Positioned(
//                         left: 170,
//                         child: Padding(
//                           padding: EdgeInsets.only(top: 8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Welcome to Aladia,',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 'Create or access your ',
//                                 style: TextStyle(fontSize: 14),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 'account from here',
//                                 style: TextStyle(fontSize: 14),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   'Enter your email',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Theme.of(context)
//                         .textTheme
//                         .bodyLarge
//                         ?.color, // Adapts to theme
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.email),
//                     labelText: 'E-mail',
//                     filled: true,
//                     fillColor: const Color.fromRGBO(158, 158, 158, 1),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.lock),
//                     labelText: 'Password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: isLoading ? null : login,
//                   child: Container(
//                     width: double.infinity,
//                     height: 50,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(
//                         width: 0,
//                       ),
//                     ),
//                     child: isLoading
//                         ? const CircularProgressIndicator(color: Colors.black)
//                         : Text(
//                             'Enter',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color:
//                                   Theme.of(context).textTheme.bodyLarge?.color,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         height: 2.5,
//                         decoration: const BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [Colors.transparent, Colors.black],
//                             begin: Alignment.centerLeft,
//                             end: Alignment.centerRight,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 10),
//                       child: Text(
//                         'Or',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         height: 2.5,
//                         decoration: const BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [Colors.black, Colors.transparent],
//                             begin: Alignment.centerLeft,
//                             end: Alignment.centerRight,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   child: SignInButton(
//                     imagePath: 'assets/google.png',
//                     text: 'Sign in with Google',
//                     color: Colors.white,
//                     textColor: Colors.black,
//                     onPressed: () {
//                       // Implement Google sign-in logic here
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 SizedBox(
//                   width: double.infinity,
//                   child: SignInButton(
//                     imagePath: 'assets/facebook.png',
//                     text: 'Sign in with Facebook',
//                     color: Colors.white,
//                     textColor: Colors.black,
//                     onPressed: () {
//                       // Implement Facebook sign-in logic here
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 SizedBox(
//                   width: double.infinity,
//                   child: SignInButton(
//                     imagePath: 'assets/apple.png',
//                     text: 'Sign in with Apple',
//                     color: Colors.white,
//                     textColor: Colors.black,
//                     onPressed: () {
//                       // Implement Apple sign-in logic here
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 GestureDetector(
//                   onTap: () {
//                     // Navigate to Terms & Conditions
//                   },
//                   child: const Text(
//                     'Terms & conditions',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SignInButton extends StatelessWidget {
//   final String imagePath;
//   final String text;
//   final Color color;
//   final Color textColor;
//   final VoidCallback onPressed;

//   const SignInButton({
//     super.key,
//     required this.imagePath,
//     required this.text,
//     required this.color,
//     required this.textColor,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton.icon(
//       icon: Image.asset(
//         imagePath,
//         width: 24,
//         height: 24,
//         fit: BoxFit.cover,
//       ),
//       label: Text(
//         text,
//         style: TextStyle(color: textColor),
//       ),
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         minimumSize: const Size(280, 50),
//         backgroundColor: color,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         elevation: 0,
//         side: const BorderSide(color: Colors.grey),
//       ),
//     );
//   }
// }

// class WideDiagonalBarPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color.fromARGB(255, 232, 228, 228)
//       ..strokeWidth = 40.0
//       ..strokeCap = StrokeCap.square
//       ..style = PaintingStyle.stroke;

//     canvas.drawLine(
//       const Offset(0, 0),
//       Offset(size.width, size.height),
//       paint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

// class SmallDiagonalBarPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color.fromARGB(255, 197, 194, 194)
//       ..strokeWidth = 5.0
//       ..strokeCap = StrokeCap.square
//       ..style = PaintingStyle.stroke;

//     canvas.drawLine(
//       const Offset(0, 0),
//       Offset(size.width, size.height),
//       paint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

import 'dart:developer';
import 'package:aladia_one/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aladia Login',
      themeMode: ThemeMode.system, // Set to system-based theme
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor:
            Colors.white, // Light theme scaffold background
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium:
              TextStyle(color: Colors.black), // All text black in light theme
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black, // Dark theme scaffold background
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium:
              TextStyle(color: Colors.white), // All text white in dark theme
        ),
      ),

      home: const SplashScreen(),
    );
  }
}

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class LoginResponse {
  final String accessToken;

  LoginResponse({
    required this.accessToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(accessToken: json['accessToken']);
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

  // Future<void> login() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   const String apiUrl = 'https://dev-api.aladia.io/v2/auth/login';
  //   String emailValue = "mobile@aladia.io";
  //   String passwordValue = "Pass@123";
  //   final response = await http.post(
  //     Uri.parse(apiUrl),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({
  //       'email': emailValue,
  //       'password': passwordValue,
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     final String accessToken = data['accessToken'];
  //     log('Login successful, token: $accessToken');
  //   } else {
  //     log('Login failed: ${response.body}');
  //   }

  //   setState(() {
  //     isLoading = false;
  //   });
  // }
  final _emailTextField = TextEditingController();
  final _passwordTextField = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // String emailValue = "mobile@aladia.io";
    // String passwordValue = "Pass@123";

    // Creating the LoginRequest model instance
    final loginRequest = LoginRequest(
      // email: emailValue,
      // password: passwordValue,
      email: _emailTextField.toString(),
      password: _passwordTextField.toString(),
    );

    try {
      // Sending the login request to the API
      final response = await http.post(
        Uri.parse('https://dev-api.aladia.io/v2/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(loginRequest.toJson()),
      );

      if (response.statusCode == 200) {
        // Parse the LoginResponse if successful
        final loginResponse = LoginResponse.fromJson(jsonDecode(response.body));

        // Handle success (e.g., save token, navigate to the next page, etc.)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Login successful! Token: ${loginResponse.accessToken}')),
        );
      } else {
        // Handle error response
        setState(() {
          _errorMessage = 'Login failed. Please check your credentials.';
        });
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'An error occurred. Please try again.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
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
                    color: Theme.of(context).scaffoldBackgroundColor,
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
                          painter: WideDiagonalBarPainter(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? const Color.fromARGB(158, 226, 224, 224)
                                    : const Color.fromRGBO(65, 65, 65, 1),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 75,
                        child: CustomPaint(
                          size: const Size(271, 140),
                          painter: SmallDiagonalBarPainter(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? const Color.fromARGB(158, 226, 224, 224)
                                    : const Color.fromRGBO(65, 65, 65, 1),
                          ),
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
                Text(
                  'Enter your email',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color, // Adapts to theme
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Theme.of(context).brightness == Brightness.light
                          ? const Color.fromRGBO(85, 85, 85, 1)
                          : const Color.fromRGBO(85, 85, 85, 1),
                    ),
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.black,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).brightness == Brightness.light
                        ? const Color.fromRGBO(158, 158, 158, 1)
                        : Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: isLoading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50), // Full width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.white
                            : Colors.black,
                    side: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.black)
                      : Text(
                          'Enter',
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2.5,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.white
                                  : Colors.black,
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or',
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 2.5,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.white
                                  : Colors.black,
                            ],
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
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Colors.black,
                    textColor: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
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
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Colors.black,
                    textColor: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
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
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Colors.black,
                    textColor: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
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
        side: BorderSide(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey
              : const Color.fromARGB(255, 52, 51, 51),
        ),
      ),
    );
  }
}

class WideDiagonalBarPainter extends CustomPainter {
  final Color color;

  WideDiagonalBarPainter({
    required this.color,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 40.0
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      const Offset(0, 0),
      Offset(size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SmallDiagonalBarPainter extends CustomPainter {
  final Color color;

  SmallDiagonalBarPainter({
    required this.color,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      const Offset(0, 0),
      Offset(size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
