import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Navigation Screen')),
        floatingActionButton: _ButtonFlotante(),
        bottomNavigationBar: _BottomNavigationBar(),
      ),
    );
  }
}

class _ButtonFlotante extends StatelessWidget {
  const _ButtonFlotante();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final model = context.read<_NotificationModel>();
        model.incrementNotificationCount();
        if (model.notificationCount >= 2) {
          model.bounceController?.forward(from: 0.0);
        }
      },
      child: const Icon(Icons.add),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: _NotificationIcon(),
        ),
      ],
    );
  }
}

class _NotificationIcon extends StatefulWidget {
  const _NotificationIcon();

  @override
  State<_NotificationIcon> createState() => _NotificationIconState();
}

class _NotificationIconState extends State<_NotificationIcon> {
  @override
  Widget build(BuildContext context) {
    final notificationCount =
        context.watch<_NotificationModel>().notificationCount;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        const FaIcon(FontAwesomeIcons.bell),
        if (notificationCount > 0)
          Positioned(
            top: 0,
            right: 0,
            child: BounceInDown(
              from: 15,
              animate: true,
              child: Bounce(
                controller: (controller) {
                  context
                      .read<_NotificationModel>()
                      .setBounceController(controller);
                },
                from: 15,
                child: Container(
                  width: 12,
                  height: 12,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$notificationCount',
                    style: const TextStyle(fontSize: 7, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int notificationCount = 0;
  AnimationController? _bounceController;

  void incrementNotificationCount() {
    notificationCount++;
    notifyListeners();
  }

  AnimationController? get bounceController => _bounceController;

  void setBounceController(AnimationController controller) {
    if (_bounceController == controller) return;
    _bounceController = controller;
  }
}
