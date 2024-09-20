import 'package:flutter/material.dart';

class ColorMixerScreen extends StatefulWidget {
  const ColorMixerScreen({super.key});

  @override
  State<ColorMixerScreen>  createState() => _ColorMixerScreenState();
}

class _ColorMixerScreenState extends State<ColorMixerScreen> {
  Color _color = Colors.white;

  void _mixColors(Color color1, Color color2) {
    setState(() {
      _color =
          Color.alphaBlend(color1.withOpacity(0.5), color2.withOpacity(0.5));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Mixer')),
      body: Column(
        children: [
          Container(
            height: 200,
            color: _color,
            child: const Center(
              child: Text('Mixed Color', style: TextStyle(color: Colors.white)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => _mixColors(Colors.red, Colors.yellow),
                child: const Text('Red + Yellow'),
              ),
              ElevatedButton(
                onPressed: () => _mixColors(Colors.blue, Colors.red),
                child: const Text('Blue + Red'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
