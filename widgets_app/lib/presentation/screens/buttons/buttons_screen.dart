import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/buttons/_components/custom_button.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons Screen')),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Elevated')),
            ElevatedButton(onPressed: null, child: Text('Elevated disabled')),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Elevated icon'),
            ),
            ElevatedButton.icon(
              onPressed: null,
              icon: Icon(Icons.add),
              label: Text('Elevated icon disabled'),
            ),

            FilledButton(onPressed: () {}, child: Text('Filled')),
            FilledButton(onPressed: null, child: Text('Filled disabled')),
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add_a_photo),
              label: Text('Filled icon'),
            ),
            FilledButton.icon(
              onPressed: null,
              icon: Icon(Icons.add_a_photo),
              label: Text('Filled icon disabled'),
            ),


            OutlinedButton(onPressed: () {}, child: Text('Outlined')),
            OutlinedButton(onPressed: null, child: Text('Outlined disabled')),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add_a_photo),
              label: Text('Outlined icon'),
            ),
            OutlinedButton.icon(
              onPressed: null,
              icon: Icon(Icons.add_a_photo),
              label: Text('Outlined icon disabled'),
            ),
          



            TextButton(onPressed: () {}, child: Text('Text')),
            TextButton(onPressed: null, child: Text('Text disabled')),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add_a_photo),
              label: Text('Text icon'),
            ),
            TextButton.icon(
              onPressed: null,
              icon: Icon(Icons.add_a_photo),
              label: Text('Text icon disabled'),
            ),


            IconButton(onPressed: () {}, icon: Icon(Icons.add_a_photo)),
            IconButton(onPressed: null, icon: Icon(Icons.add_a_photo)),
            IconButton.filled(onPressed: () {}, icon: Icon(Icons.add_a_photo)),
            IconButton.filled(onPressed: null, icon: Icon(Icons.add_a_photo)),
            IconButton.outlined(onPressed: () {}, icon: Icon(Icons.add_a_photo)),
            IconButton.outlined(onPressed: null, icon: Icon(Icons.add_a_photo)),

            // Custom buttons
            CustomButton(),
            
          ],
        ),
      ),
    );
  }
}
