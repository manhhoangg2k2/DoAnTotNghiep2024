import 'package:flutter/material.dart';

class CurvedBottomBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();

    // Vẽ thanh ngang
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.25, 0);
    // Vẽ đoạn cong lên
    path.quadraticBezierTo(
      size.width * 0.50, size.height * 0.5,
      size.width * 0.75, 0,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
