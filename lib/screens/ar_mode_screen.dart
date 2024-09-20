import 'package:flutter/material.dart';

class ARModeScreen extends StatelessWidget {
  const ARModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AR Mode')),
      body: const Center(
        child:
            Text('Point your camera at objects to learn about their colors.'),
      ),
    );
  }
}
