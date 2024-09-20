import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rangyatra/screens/ar_mode_screen.dart';
import 'package:rangyatra/screens/color_mixer_screen.dart';
import 'package:rangyatra/screens/color_puzzle_screen.dart';
import 'package:rangyatra/widgets/gradient_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPage();
  }

  void _loadPage() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _isLoading == true
              ? Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img9.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                )
              : Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img9.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GradientButton(
                          title: 'Color Puzzle',
                          colors: const [Colors.cyanAccent, Colors.lightGreen],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ColorPuzzleScreen()),
                            );
                          },
                        ),
                        const SizedBox(height: 20), // Spacing between buttons
                        GradientButton(
                          title: 'Color Mixer',
                          colors: const [Colors.blue, Colors.purple],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ColorMixerScreen()),
                            );
                          },
                        ),
                        const SizedBox(height: 20), // Spacing between buttons
                        GradientButton(
                          title: 'AR Mode',
                          colors: const [Colors.red, Colors.orange],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ARModeScreen()),
                            );
                          },
                        ),
                        const SizedBox(height: 120),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
