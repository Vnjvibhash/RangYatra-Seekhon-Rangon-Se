import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:rangyatra/models/color_model.dart';

class ColorService {
  Future<List<ColorItem>> loadColors(int level) async {
    final String response = await rootBundle.loadString('assets/colors.json');
    final Map<String, dynamic> data = json.decode(response);
    List<ColorItem> colorItems = [];

    String levelKey = 'level${level}';
    if (data['levels'][levelKey] != null) {
      for (var color in data['levels'][levelKey]) {
        colorItems.add(ColorItem.fromJson(color));
      }
    }

    return colorItems;
  }
}

