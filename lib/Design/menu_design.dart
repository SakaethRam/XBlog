import 'package:flutter/material.dart';

class MenuIconPainter extends CustomPainter {
  final Color iconColor; // Add a parameter for color

  MenuIconPainter({required this.iconColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = iconColor // Use the provided color
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 3.0; // Adjust thickness

    // Draw first (longer) line
    canvas.drawLine(
      Offset(0, size.height * 0.3),
      Offset(size.width, size.height * 0.3),
      paint,
    );

    // Draw second (shorter) line
    canvas.drawLine(
      Offset(0, size.height * 0.7),
      Offset(size.width * 0.5, size.height * 0.7),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
