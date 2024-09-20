import 'package:flutter/material.dart';

class ColorPalette extends StatelessWidget {
  final List<Color> colors;
  final Function onColorSelect;

  const ColorPalette({
    super.key, 
    required this.colors, 
    required this.onColorSelect
    });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: colors.map((color) {
        return GestureDetector(
          onTap: () => onColorSelect(color),
          child: Container(
            margin: const EdgeInsets.all(8.0),
            width: 50,
            height: 50,
            color: color,
          ),
        );
      }).toList(),
    );
  }
}
