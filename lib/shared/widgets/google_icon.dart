import 'package:flutter/material.dart';

class GoogleIcon extends StatelessWidget {
  final double size;

  const GoogleIcon({super.key, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: GoogleIconPainter()),
    );
  }
}

class GoogleIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Main circle
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.4;

    // Draw the "G" shape
    paint.color = Colors.white;

    // Outer circle
    canvas.drawCircle(center, radius, paint);

    // Inner elements to create "G" shape
    paint.color = const Color(0xFF4285F4); // Google Blue

    // Draw Google G simplified
    final rect = Rect.fromCenter(
      center: center,
      width: size.width * 0.6,
      height: size.height * 0.6,
    );

    // Draw a simplified "G"
    canvas.drawArc(
      rect,
      -1.57, // Start from top
      4.71, // 270 degrees
      false,
      Paint()
        ..color = const Color(0xFF4285F4)
        ..style = PaintingStyle.stroke
        ..strokeWidth = size.width * 0.15,
    );

    // Horizontal line for "G"
    canvas.drawLine(
      Offset(center.dx, center.dy),
      Offset(center.dx + radius * 0.6, center.dy),
      Paint()
        ..color = const Color(0xFF4285F4)
        ..strokeWidth = size.width * 0.15,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
