import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
        ),
        body: Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(counter.toString(), style: TextStyle(fontSize: 160, fontWeight: FontWeight.w300),),
              SizedBox(height: 20),
              Text( counter == 1 ? 'Click' : 'Clicks', style: TextStyle(fontSize: 24),),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'increment',
              backgroundColor: Colors.green,
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: Icon(Icons.add, color: Colors.white),
            ),
            SizedBox(height: 12),
            FloatingActionButton(
              heroTag: 'decrement',
              backgroundColor: counter == 0 ? Colors.grey : Colors.red,
              onPressed: counter == 0 ? null : () {
                setState(() {
                  counter--;
                });
              },
              child: Icon(Icons.remove, color: Colors.white),
            ),
            SizedBox(height: 12),
            FloatingActionButton(
              heroTag: 'reset',
              backgroundColor: counter == 0 ? Colors.grey : Colors.orange,
              onPressed: counter == 0 ? null : () {
                setState(() {
                  counter = 0;
                });
              },
              child: Icon(Icons.refresh, color: Colors.white),
            ),
          ],
        )
      );
  }
}