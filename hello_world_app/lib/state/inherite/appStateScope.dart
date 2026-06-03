import 'package:flutter/widgets.dart';
import 'package:hello_world_app/state/inherite/appState.dart';

class AppStateScope extends InheritedWidget {
  final AppState appState;

  const AppStateScope(
    this.appState, {
    super.key,
    required super.child,
  });
  
  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    return appState == oldWidget.appState;
  }

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.appState;
  }
}