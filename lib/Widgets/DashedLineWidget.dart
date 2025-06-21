import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:skills_over_flow_app/utils/color_constants.dart';

class DashedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedLinePainter(),
      size: Size(double.infinity, 1), // ارتفاع الخط
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = yellowColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    var path = Path();
    path.moveTo(0, size.height / 2); // بداية الخط
    path.lineTo(size.width, size.height / 2); // نهاية الخط

    // جعل الخط متقطعًا (كل 5px خط، 5px فراغ)
    var dashedPath = dashPath(
      path,
      dashArray: CircularIntervalList<double>([5, 5]),
    );

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}