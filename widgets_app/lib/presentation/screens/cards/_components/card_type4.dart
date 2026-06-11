import 'package:flutter/material.dart';

class CardType4 extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final double elevation;
  const CardType4({
    required this.title,
    required this.image,
    required this.description,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      color: colors.surfaceContainerHighest,

      child: Stack(
        children: [
          if (image.isNotEmpty)
            Image.network(
              image,
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
              ),
              child: IconButton(
                icon: Icon(Icons.more_vert_outlined, size: 20),
                onPressed: () {},
              ),
            ),
          ),

        ],
      ),
    );
  }
}
