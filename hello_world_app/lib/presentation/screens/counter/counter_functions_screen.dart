import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/widgets/buttons/custom_button.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter Functions'),
          leading: IconButton(
            icon: Icon(
              Icons.refresh_outlined,
              color: counter == 0 ? Colors.grey : Colors.orange,
            ),
            onPressed: counter == 0 ? null : () {
              setState(() {
                counter = 0;
              });
            },
          ),
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              heroTag: 'increment',
              activeColor: Colors.green,
              icon: Icons.plus_one_outlined,
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
            ),
            SizedBox(height: 5),
            CustomButton(
              heroTag: 'decrement',
              activeColor: Colors.red,
              icon: Icons.exposure_minus_1_outlined,
              onPressed: counter == 0 ? null : () {
                setState(() {
                  counter--;
                });
              },
            ),
          ],
        )
      );
  }
}