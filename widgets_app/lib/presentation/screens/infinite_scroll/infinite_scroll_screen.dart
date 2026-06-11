import 'package:flutter/material.dart';

class InfiniteScrollScreen extends StatelessWidget {
  static const name = 'infinite_scroll_screen';
  const InfiniteScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Infinite Scroll Screen')),
      body: const _InfiniteScrollView(),
    );
  }
}

class _InfiniteScrollView extends StatelessWidget {
  const _InfiniteScrollView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) => Text('Item $index'),
    );
  }
}