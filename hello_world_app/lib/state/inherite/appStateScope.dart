import 'package:flutter/widgets.dart';
import 'package:hello_world_app/state/inherite/appState.dart';

class AppStateScope extends InheritedWidget {
  final AppState appState;

  AppStateScope(
    this.appState, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);
  
  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    return appState == oldWidget.appState;
  }

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.appState;
  }
}