import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:videos_app/presentation/screens/animations/welcome.dart';
import 'package:videos_app/presentation/screens/discover/discover_screen.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, 
            CupertinoPageRoute(builder: (context) => WelcomeScreen()));
          }, icon: FaIcon(FontAwesomeIcons.twitter)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person_rounded)),
          SlideInLeft(
            from: 100,
            child: IconButton(onPressed: () {
              Navigator.push(context, 
              CupertinoPageRoute(builder: (context) => Page1()));
            }, icon: Icon(Icons.navigate_next_rounded)),
          ),
        ],
      ),
      floatingActionButton: BounceInUp(
        child: FloatingActionButton(
          onPressed: () {},
          child: FaIcon(FontAwesomeIcons.plus),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(seconds: 2),
              child: Icon(Icons.new_releases, color: Colors.blue, size: 40)),
            FadeInDown(
              duration: Duration(seconds: 2),
              child: Text('Title page', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),)),
            FadeInDown(
              duration: Duration(seconds: 3),
              child: Text('Subtitle page', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)),

            FadeInLeft(
              delay: Duration(seconds: 2),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.grey.shade300,
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}