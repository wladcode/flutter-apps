import 'package:flutter/material.dart';
import "dart:math" show Random;

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
double _width = 200;
double _height = 100;
Color _color = Colors.blue;
BorderRadius _borderRadius = BorderRadius.circular(0);

void _changeShape() {
  setState(() {
    final random = Random();
    _width = random.nextInt(300) + 50;
    _height = random.nextInt(500) + 25;
    _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Container')),
      body: Column(
        children: [

          Text('Width: $_width'),
          Text('Height: $_height'),
          Text('Color: $_color'),
          Text('BorderRadius: $_borderRadius'),

          SizedBox(width: 50),
          Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: _width,
            height: _height,
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: _color,
            ),
          ),
              ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          _changeShape();
        },
      ),
    );
  }
}


