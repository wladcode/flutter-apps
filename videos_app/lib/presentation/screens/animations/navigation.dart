import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('Navigation Screen')),
        floatingActionButton: _ButtonFlotante(),


      
        bottomNavigationBar: _BottomNavigationBar()
        
      ),
    );
  }
}

class _ButtonFlotante extends StatelessWidget {
  const _ButtonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {
      final model = Provider.of<_NotificationModel>(context, listen: false);
      final numero = model.notificationCount;
      model.incrementNotificationCount();

      if (numero >= 2) {
        final bounceController = model.bounceController;
        bounceController?.forward(from: 0.0);
      }
    }, child: Icon(Icons.add));
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationCount = Provider.of<_NotificationModel>(context).notificationCount;
    return BottomNavigationBar(
      
        currentIndex: 0,
          //selectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            //BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
              label: 'Notifications',
              icon: Stack(
                children: [
                  FaIcon(FontAwesomeIcons.bell),
                  Positioned(
                    top: 0,
                    right: 0,
                    //child: Icon(Icons.brightness_1, size: 12, color: Colors.red),
                    child: BounceInDown(
                      from: 15,
                      animate: notificationCount > 0 ? true : false,
                      child: Bounce(
                        controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                        from: 15,
                        child: Container(
                          child: Text('$notificationCount', style: TextStyle(fontSize: 7, color: Colors.white),),
                          width: 12, height: 12,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                                           ),
                      ),
                    ),
                  ),
                ],
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

  set bounceController(AnimationController controller) {
    _bounceController = controller;
  }
}