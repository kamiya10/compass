import 'dart:math';

import 'package:flutter/material.dart';

double degreeToRadians(num angle) {
  return angle * pi / 180;
}

Offset polarToCartesian(num radius, num angle) {
  return Offset(radius * cos(degreeToRadians(angle)), radius * sin(degreeToRadians(angle)));
}
