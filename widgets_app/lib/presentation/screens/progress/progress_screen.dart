import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress Screen')),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 10),
          Text('Circular progress indicator'),
          CircularProgressIndicator(strokeWidth: 2),

          SizedBox(height: 20),
          Text('Circular progress indicator'),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black12,
          ),

          SizedBox(height: 20),
          Text('Circular and linear progress indicator controlled'),
          _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 10) / 100;
      }).takeWhile((value) => value <= 1),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              CircularProgressIndicator(strokeWidth: 2, value: progressValue),
              SizedBox(width: 20),
              Expanded(child: LinearProgressIndicator(value: progressValue)),
              SizedBox(width: 20),
              Text('${(progressValue * 100).toStringAsFixed(0)}%'),
            ],
          ),
        );
      },
    );
  }
}
