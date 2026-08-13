import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widgets App')),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.menuItem});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle ?? ''),
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios, color: colors.primary),
      onTap: () {
        // Para navegacion con Navigator.of(context).push
              /*
      Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => const ButtonsScreen(),
          ),
        );      
        */  

        // Para navegacion con Navigator.pushNamed
        //Navigator.pushNamed(context, menuItem.link);

        // Para navegacion con GoRouter
        context.push(menuItem.link);
        
        // Para navegacion con GoRouter por nombre de la ruta
        //context.pushNamed(ButtonsScreen.name);
      },
    );
  }
}
