// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Container(
//             width: double.infinity,
//             height: 150,
//             child:
//             CustomPaint(
//               painter: DiagonalBarPainter(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DiagonalBarPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Define the paint style
//     final paint = Paint()
//       ..color =
//           const Color.fromARGB(255, 223, 222, 222) // Set the color to grayish
//       ..strokeWidth = 30.0 // Set the width of the diagonal bar
//       ..strokeCap = StrokeCap.round // Optional: Make the ends rounded
//       ..style = PaintingStyle.stroke;

//     // Draw the diagonal line from top left to bottom right
//     canvas.drawLine(
//       Offset(0, 0), // Start at the top-left corner
//       Offset(size.width, size.height), // End at the bottom-right corner
//       paint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false; // No need to repaint as the drawing is static
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            height: 150,
            child: CustomPaint(
              painter: DiagonalBarPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class DiagonalBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the shadow paint style
    final shadowPaint = Paint()
      ..color = Colors.grey.withOpacity(0.5) // Set shadow color and opacity
      ..strokeWidth = 30.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Draw the shadow line slightly offset from the main line
    canvas.drawLine(
      Offset(3, 3), // Start a bit offset for the shadow
      Offset(
          size.width + 3, size.height + 3), // End a bit offset for the shadow
      shadowPaint,
    );

    // Define the main paint style
    final paint = Paint()
      ..color = const Color.fromARGB(255, 223, 222, 222) // Main line color
      ..strokeWidth = 30.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Draw the main diagonal line from top left to bottom right
    canvas.drawLine(
      Offset(0, 0), // Start at the top-left corner
      Offset(size.width, size.height), // End at the bottom-right corner
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint as the drawing is static
  }
}
