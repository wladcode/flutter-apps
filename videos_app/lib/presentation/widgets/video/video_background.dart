import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  final List<Color> customColors;
  final List<double> customStops;
  const VideoBackground({
    super.key,
    this.customColors = const [
      Colors.transparent,
      Colors.black26,
      Colors.black87,
    ],
    this.customStops = const [0.0, 0.5, 1.0],
  }) : assert(
          customColors.length == customStops.length,
          'customColors and customStops must have the same length',
        );

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: customColors,
            stops: customStops,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
