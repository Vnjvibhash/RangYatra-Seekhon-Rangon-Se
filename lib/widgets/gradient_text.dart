import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final List<Color> gradientColors;
  final double fontSize;
  final FontWeight fontWeight;

  const GradientText({
    super.key,
    required this.text,
    required this.gradientColors,
    this.fontSize = 18.0, // Default font size
    this.fontWeight = FontWeight.normal, // Default font weight
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors
              .white, // This is required but will be overridden by the gradient
        ),
      ),
    );
  }
}
