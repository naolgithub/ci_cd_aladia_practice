// import 'package:flutter/material.dart';
// import 'package:widgetbook/widgetbook.dart';
// import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// void main() {
//   runApp(const WidgetbookApp());
// }

// class WidgetbookApp extends StatelessWidget {
//   const WidgetbookApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Widgetbook.material(
//       directories: const [],
//       addons: [
//         DeviceFrameAddon(devices: Devices.ios.all),
//         InspectorAddon(),
//         GridAddon(100),
//         AlignmentAddon(),
//         ZoomAddon(),
//       ],
//     );
//   }
// }

/// A complete example for Widgetbook manual approach
///
/// Use [WidgetbookFolder],[WidgetbookComponent], and [WidgetbookUseCase]
/// to create directories
/// [Ref link]: https://docs.widgetbook.io/guides/complete-example

import 'package:aladia_one/aladia.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart' hide AlignmentAddon;

import 'components/container.dart';
import 'components/custom_card.dart';
import 'components/email_text_field.dart';
import 'customs/custom_addon.dart';
import 'customs/custom_knob.dart';

/// Painter for Wide Diagonal Bar

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

/// Painter for Small Diagonal Bar
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

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        DeviceFrameAddon(devices: Devices.ios.all),
        InspectorAddon(),
        // InspectorAddon(enabled: true),
        GridAddon(100),
        AlignmentAddon(),
        ZoomAddon(),

        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light Theme',
              data: ThemeData.light(),
            ),
            WidgetbookTheme(
              name: 'Dark Theme',
              data: ThemeData.dark(),
            ),
          ],
        )
      ],
      directories: [
        WidgetbookFolder(
          name: 'Widgets',
          children: [
            WidgetbookComponent(
              name: 'CustomContainer',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default Style',
                  builder: (context) => greenContainerUseCase(context),
                ),
              ],
            ),
            //me start
            WidgetbookComponent(
              name: 'Login Screen',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const LoginScreen(),
                ),
              ],
            ),
            //me end

            WidgetbookComponent(
              name: 'CustomCard',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default Style',
                  builder: (context) => const CustomCard(
                    child: Text('This is a custom card'),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'With Custom Background Color',
                  builder: (context) => CustomCard(
                    backgroundColor: Colors.green.shade100,
                    child: const Text(
                      'This is a custom card with a custom background color',
                    ),
                  ),
                ),
              ],
            ),
            // CustomTextField component use-cases
            WidgetbookComponent(
              name: 'Email Field',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default Style',
                  builder: (context) => EmailTextField(
                    controller: TextEditingController(),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'With Hint Text',
                  builder: (context) => EmailTextField(
                    controller: TextEditingController(),
                    hintText: 'Enter your email here',
                  ),
                ),
              ],
            ),
          ],
        ),
        //Me widgetbook folder started
        WidgetbookFolder(
          name: 'Buttons',
          children: [
            WidgetbookComponent(
              name: 'SignIn Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Google Button',
                  builder: (context) => SignInButton(
                    imagePath: 'assets/google.png',
                    text: 'Sign in with Google',
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {
                      // Add sign-in logic
                    },
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Facebook Button',
                  builder: (context) => SignInButton(
                    imagePath: 'assets/facebook.png',
                    text: 'Sign in with Facebook',
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {
                      // Add sign-in logic
                    },
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Apple Button',
                  builder: (context) => SignInButton(
                    imagePath: 'assets/apple.png',
                    text: 'Sign in with Apple',
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {
                      // Add sign-in logic
                    },
                  ),
                ),
              ],
            ),
          ],
        ),

        WidgetbookFolder(
          name: 'Painters',
          children: [
            WidgetbookComponent(
              name: 'Diagonal Bars',
              useCases: [
                WidgetbookUseCase(
                  name: 'Wide Diagonal Bar',
                  builder: (context) => SizedBox(
                    width: 200,
                    height: 100,
                    child: CustomPaint(
                      painter: WideDiagonalBarPainter(),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Small Diagonal Bar',
                  builder: (context) => SizedBox(
                    width: 200,
                    height: 100,
                    child: CustomPaint(
                      painter: SmallDiagonalBarPainter(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        WidgetbookUseCase(
          name: 'Aladia Logo',
          builder: (context) => Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(
              'assets/app_icon.png',
              scale: 8,
            ),
          ),
        ),

        WidgetbookFolder(
          name: 'Divider widgets',
          children: [
            WidgetbookComponent(
              name: 'Two dividers',
              useCases: [
                WidgetbookUseCase(
                  name: 'Divider',
                  builder: (context) => Row(
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
                ),
              ],
            ),
          ],
        ),

        WidgetbookFolder(
          name: 'Enter Buttons',
          children: [
            WidgetbookComponent(
              name: 'Enter',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 0,
                      ),
                    ),
                    child:
                        // isLoading
                        //     ? const CircularProgressIndicator(color: Colors.black)
                        //     :
                        const Text(
                      'Enter',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        WidgetbookComponent(
          name: 'Enter your email',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) => const Text(
                'Enter your email',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'Email Textfield',
          children: [
            WidgetbookComponent(
              name: 'Email',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => TextField(
                    controller: TextEditingController(),
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
                ),
              ],
            ),
          ],
        ),

        WidgetbookFolder(
          name: 'knobs',
          children: [
            WidgetbookComponent(
              name: 'RangeSlider',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => rangeSlider(context),
                ),
              ],
            ),
          ],
        ),
      ],
      // Optional app builder
      appBuilder: materialAppBuilder,
      // Theme configurations (light and dark themes)
      lightTheme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // Set theme mode to system (or specify light or dark as per your preference)
      themeMode: ThemeMode.system,
    );
  }
}
