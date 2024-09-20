import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rangyatra/screens/home_screen.dart';
import 'package:rangyatra/widgets/gradient_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              // Zoom background effect
              Transform.scale(
                scale: _animation.value,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/splash_img.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Splash text
              const Center(
                child: Column(
                  children: [
                    Spacer(),
                    GradientText(
                      text: 'RangYatra\nSeekhon Rangon Se',
                      gradientColors: [Colors.redAccent, Colors.lightGreen],
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                    SizedBox(height: 120),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
