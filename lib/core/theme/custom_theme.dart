import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/core/utils/color_utils.dart';

class CustomTheme {
  static const double horizontalPadding = 16;
  static MaterialColor primaryColor = const Color(0xFF4649FF).materialColor;

  static MaterialColor grey = const Color(0xFF7D7D7D).materialColor;
}

extension on Color {
  MaterialColor get materialColor =>
      ColorUtils.generateMaterialColor(color: this);
}
