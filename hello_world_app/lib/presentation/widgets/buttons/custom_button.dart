import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String heroTag;
  final Color activeColor;
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.heroTag,
    required this.activeColor,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;

    return FloatingActionButton(
      shape: CircleBorder(),
      heroTag: heroTag,
      backgroundColor: isDisabled ? Colors.grey : activeColor,
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white),
    );
  }
}
