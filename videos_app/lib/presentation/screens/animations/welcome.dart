import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool showLogo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showLogo = true;
          });
        },
        child: FaIcon(FontAwesomeIcons.play, color: Colors.red),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ZoomOut(
          animate: showLogo,
          from: 30,
          duration: Duration(seconds: 1),
          child: FaIcon(FontAwesomeIcons.youtube, size: 100, color: Colors.red)),
      ),
    );
  }
}