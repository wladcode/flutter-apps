import 'package:flutter/material.dart';
class CardType3 extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final double elevation;
  const CardType3({
    required this.title,
    required this.image,
    required this.description,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      elevation: elevation,
      color: colors.surfaceContainerHighest,
     
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.more_vert_outlined, size: 20),
                onPressed: () {},
              ),
            ),
            Align(alignment: Alignment.topLeft, child: Text(title)),
           // if (image.isNotEmpty) Image(image: NetworkImage(image)),
            if (description.isNotEmpty) Text('$description - Filled'),
          ],
        ),
      ),
    );
  }
}