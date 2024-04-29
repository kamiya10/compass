import 'package:compass/extension.dart';
import 'package:compass/utils.dart';
import 'package:flutter/material.dart';

class Compass extends StatelessWidget {
  final double radius;

  const Compass({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ConpassPainter(context: context, radius: radius),
    );
  }
}

class ConpassPainter extends CustomPainter {
  final BuildContext context;
  final double radius;

  ConpassPainter({super.repaint, required this.context, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < 360; i += 15) {
      var paint = Paint();
      paint.strokeWidth = radius / 15;
      paint.strokeCap = StrokeCap.round;

      var p1 = polarToCartesian(radius, i);

      if (i % 90 == 0) {
        var p2 = polarToCartesian(radius - radius / 12, i);
        paint.color = (i == 270) ? context.colors.primary : context.colors.secondary.withOpacity(0.6);
        canvas.drawLine(p1, p2, paint);
      } else {
        var p2 = polarToCartesian(radius, i);

        if (i % 45 == 0) {
          paint.color = context.colors.secondary.withOpacity(0.4);
          canvas.drawLine(p1, p2, paint);
        } else {
          paint.color = context.colors.secondaryContainer.withOpacity(0.6);
          canvas.drawLine(p1, p2, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
