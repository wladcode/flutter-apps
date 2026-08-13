import 'package:flutter/material.dart';
class CardType1 extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final double elevation;
  const CardType1({super.key, 
    required this.title,
    required this.image,
    required this.description,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
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
            if (description.isNotEmpty) Text(description),
          ],
        ),
      ),
    );
  }
}