import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/screens/counter/counter_screen.dart';
import 'package:hello_world_app/presentation/screens/counter/counter_functions_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.lightBlue,
        colorSchemeSeed: Colors.lightBlue
      ),
      home: CounterFunctionsScreen()
    );
  }
}