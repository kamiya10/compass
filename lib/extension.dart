import 'package:flutter/material.dart';

extension CommonContext on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}

extension Direction on double {
  String get direction {
    if (this >= 0 && this < 22.5 || this >= 337.5 && this < 360) {
      return "N";
    } else if (this >= 22.5 && this < 67.5) {
      return "NE";
    } else if (this >= 67.5 && this < 112.5) {
      return "E";
    } else if (this >= 112.5 && this < 157.5) {
      return "SE";
    } else if (this >= 157.5 && this < 202.5) {
      return "S";
    } else if (this >= 202.5 && this < 247.5) {
      return "SW";
    } else if (this >= 247.5 && this < 292.5) {
      return "W";
    } else if (this >= 292.5 && this < 337.5) {
      return "NW";
    }
    return "";
  }
}
