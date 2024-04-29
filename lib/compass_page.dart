import 'package:compass/extension.dart';
import 'package:compass/widget/compass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class CompassPage extends StatefulWidget {
  const CompassPage({super.key});

  @override
  State<CompassPage> createState() => _CompassPageState();
}

class _CompassPageState extends State<CompassPage> {
  double heading = 0;
  double turns = 0;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events?.listen((CompassEvent event) {
      double? direction = event.heading;

      if (direction != null) {
        var prevValue = heading;

        direction = ((direction < 0 ? (360 + direction) : direction) * 100).roundToDouble() / 100;

        double diff = direction - prevValue;

        if (diff.abs() > 180) {
          if (prevValue > direction) {
            diff = 360 - (direction - prevValue).abs();
          } else {
            diff = 360 - (prevValue - direction).abs();
            diff = diff * -1;
          }
        }

        setState(() {
          turns -= (diff / 360);
          heading = direction!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  heading.direction,
                  style: TextStyle(
                    fontSize: 20,
                    color: context.colors.secondary,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "${heading.round()}º",
                  style: TextStyle(
                    fontSize: 48,
                    color: context.colors.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: context.colors.primary),
            ),
            const SizedBox(height: 340),
            AnimatedRotation(
              turns: turns,
              duration: Durations.short2,
              child: const Compass(
                radius: 320,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
