import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
import 'package:rangyatra/models/color_model.dart';
import 'package:rangyatra/services/color_service.dart';
import 'package:rangyatra/widgets/color_box.dart';
import 'package:rangyatra/widgets/gradient_text.dart';

class ColorPuzzleScreen extends StatefulWidget {
  const ColorPuzzleScreen({super.key});

  @override
  State<ColorPuzzleScreen> createState() => _ColorPuzzleScreenState();
}

class _ColorPuzzleScreenState extends State<ColorPuzzleScreen> with SingleTickerProviderStateMixin {
  final ColorService _colorService = ColorService();
  List<ColorItem> _colorItems = [];
  ColorItem? _targetColorItem;
  ColorItem? _selectedColorItem;
  final int _colorCount = 4;
  int _level = 1;
  int _correctMoves = 0;
  int _totalMoves = 0;

  @override
  void initState() {
    super.initState();
    _loadColors();
  }

  Future<void> _loadColors() async {
    setState(() {
    });
    await Future.delayed(const Duration(seconds: 1));
    List<ColorItem> colors = await _colorService.loadColors(_level);
    setState(() {
      _colorItems = colors;
      _generateNewPuzzle();
    });
  }

  void _generateNewPuzzle() {
    final random = Random();
    _colorItems.shuffle();
    if (_colorItems.isNotEmpty) {
      _targetColorItem = _colorItems[random.nextInt(_colorCount)];
      _selectedColorItem = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      body: Stack(
        children: [
          _targetColorItem == null
              ? Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img5.jpg'),
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
                      image: AssetImage('assets/images/img5.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const Spacer(),
                        GradientText(
                          text:
                              'Accuracy is ${_correctMoves == 0 ? 0.00 : ((100 * _correctMoves) / _totalMoves).toStringAsFixed(2)}%',
                          gradientColors: const [Colors.orange, Colors.purple],
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                        const SizedBox(height: 20),
                        GradientText(
                          text: 'Which color is ${_targetColorItem?.name}?',
                          gradientColors: const [Colors.red, Colors.black],
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                        const Spacer(),
                        GradientText(
                          text: '$_level',
                          gradientColors: const [
                            Colors.cyanAccent,
                            Colors.lightGreen
                          ],
                          fontSize: 120,
                          fontWeight: FontWeight.w900,
                        ),
                        const GradientText(
                          text: 'Level',
                          gradientColors: [
                            Colors.cyanAccent,
                            Colors.lightGreen
                          ],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        Expanded(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(_colorCount, (index) {
                                ColorItem colorItem = _colorItems[index];
                                bool isSelected =
                                    _selectedColorItem == colorItem;
                                return GestureDetector(
                                  onTap: () => _handleColorTap(colorItem),
                                  child: ColorBox(
                                    colorItem: colorItem,
                                    isSelected: isSelected,
                                    size: screenWidth / 4 - 10,
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  void _handleColorTap(ColorItem selectedColorItem) {
    setState(() {
      _selectedColorItem = selectedColorItem;
      bool isCorrect = selectedColorItem == _targetColorItem;

      if (isCorrect) {
        _correctMoves++;
        if (_totalMoves >= 10 && _level < 2) {
          _level = 2;
          _loadColors();
        } else if (_totalMoves >= 25 && _level < 3) {
          _level = 3;
          _loadColors();
        } else if (_totalMoves >= 45 && _level < 4) {
          _level = 4;
          _loadColors();
        } else if (_totalMoves >= 60 && _level < 5) {
          _level = 5;
          _loadColors();
        }
        _generateNewPuzzle();
      } else {
        _showDialog(isCorrect);
      }
      _totalMoves++;
    });
  }

  void _showDialog(bool isCorrect) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Try Again'),
          content: const Text('This is not the correct color. Try again!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    ).then(
      (_) {
        setState(() {
          _selectedColorItem = null;
        });
      },
    );
  }
}
