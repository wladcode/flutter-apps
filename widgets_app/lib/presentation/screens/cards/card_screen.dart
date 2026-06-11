import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/cards/_components/card_components.dart';

const weidth = 600;
const height = 350;

const cardsData = <Map<String, dynamic>>[
  {
    'title': 'Card Elevation 0',
    'image': 'https://picsum.photos/id/0/$weidth/$height',
    'description': 'This is the first card',
    'elevation': 0.0,
  },
  {
    'title': 'Card Elevation 1',
    'image': 'https://picsum.photos/id/1/$weidth/$height',
    'description': 'This is the second card',
    'elevation': 1.0,
  },
  {
    'title': 'Card Elevation 2',
    'image': 'https://picsum.photos/id/2/$weidth/$height',
    'description': 'This is the third card',
    'elevation': 2.0,
  },
  {
    'title': 'Card Elevation 3',
    'image': 'https://picsum.photos/id/3/$weidth/$height',
    'description': 'This is the fourth card',
    'elevation': 3.0,
  },
  {
    'title': 'Card Elevation 4',
    'image': 'https://picsum.photos/id/4/$weidth/$height',
    'description': 'This is the fifth card',
    'elevation': 4.0,
  },
  {
    'title': 'Card Elevation 5',
    'image': 'https://picsum.photos/id/5/$weidth/$height',
    'description': 'This is the sixth card',
    'elevation': 5.0,
  },
];

class CardScreen extends StatelessWidget {
  static const name = 'cards_screen';
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card Screen')),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          Align(alignment: Alignment.center, child: Text('Card Type 1')),


          ...cardsData.map(
            (card) => CardType1(
              title: card['title'],
              image: card['image'],
              description: card['description'],
              elevation: card['elevation'],
            ),
          ),

          Align(alignment: Alignment.center, child: Text('Card Type 2')),
          ...cardsData.map(
            (card) => CardType2(
              title: card['title'],
              image: card['image'],
              description: card['description'],
              elevation: card['elevation'],
            ),
          ),

          Align(alignment: Alignment.center, child: Text('Card Type 3')),
          ...cardsData.map(
            (card) => CardType3(
              title: card['title'],
              image: card['image'],
              description: card['description'],
              elevation: card['elevation'],
            ),
          ),

          
          Align(alignment: Alignment.center, child: Text('Card Type 4')),
          ...cardsData.map(
            (card) => CardType4(
              title: card['title'],
              image: card['image'],
              description: card['description'],
              elevation: card['elevation'],
            ),
          ),



          SizedBox(height: 50),
        ],
      ),
    );
  }
}


