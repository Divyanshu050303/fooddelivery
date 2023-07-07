import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black // Customize the line color
      ..strokeWidth = 2.0; // Customize the line thickness

    final startPoint = Offset(0, size.height / 2); // Starting point of the line
    final endPoint = Offset(size.width, size.height / 2); // Ending point of the line

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      size: Size(double.infinity, 1.0), // Customize the line height
    );
  }
}
