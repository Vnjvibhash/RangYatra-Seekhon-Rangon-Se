class ColorItem {
  final String name;
  final String code;

  ColorItem({required this.name, required this.code});

  factory ColorItem.fromJson(Map<String, dynamic> json) {
    return ColorItem(
      name: json['name'],
      code: json['code'],
    );
  }
}
