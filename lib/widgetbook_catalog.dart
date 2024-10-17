// import 'package:flutter/material.dart';
// import 'package:widgetbook/widgetbook.dart';
// import 'main.dart';

// void main() {
//   runApp(WidgetbookApp());
// }

// class WidgetbookApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Widgetbook(
//       appInfo: AppInfo(name: 'Aladia Login App'),
//       themes: [
//         WidgetbookTheme(
//           name: 'Default',
//           data: ThemeData(
//             primarySwatch: Colors.grey,
//           ),
//         ),
//       ],
//       categories: [
//         WidgetbookCategory(
//           name: 'Screens',
//           widgets: [
//             WidgetbookComponent(
//               name: 'Login Screen',
//               useCases: [
//                 WidgetbookUseCase(
//                   name: 'Default',
//                   builder: (context) => const LoginScreen(),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         WidgetbookCategory(
//           name: 'Components',
//           widgets: [
//             WidgetbookComponent(
//               name: 'SignInButton',
//               useCases: [
//                 WidgetbookUseCase(
//                   name: 'Google Sign-In',
//                   builder: (context) => SignInButton(
//                     imagePath: 'assets/google.png',
//                     text: 'Sign in with Google',
//                     color: Colors.white,
//                     textColor: Colors.black,
//                     onPressed: () {},
//                   ),
//                 ),
//                 WidgetbookUseCase(
//                   name: 'Facebook Sign-In',
//                   builder: (context) => SignInButton(
//                     imagePath: 'assets/facebook.png',
//                     text: 'Sign in with Facebook',
//                     color: Colors.white,
//                     textColor: Colors.black,
//                     onPressed: () {},
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
