import 'package:flutter/material.dart';
import 'package:rangyatra/models/color_model.dart';

class ColorBox extends StatelessWidget {
  final ColorItem colorItem;
  final bool isSelected;
  final double size;

  const ColorBox({
    super.key,
    required this.colorItem,
    required this.isSelected,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Color(int.parse(colorItem.code.replaceAll('#', '0xff'))),
          shape: BoxShape.circle,
          boxShadow: isSelected
              ? [
                  const BoxShadow(
                    color: Colors.black54,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: Offset(4.0, 4.0),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            colorItem.name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
