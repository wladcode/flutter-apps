import 'package:flutter/widgets.dart';
import 'package:hello_world_app/domain/entities/message.dart';
import 'package:hello_world_app/state/inherite/appState.dart';
import 'package:hello_world_app/state/inherite/appStateScope.dart';

class AppStateWidget extends StatefulWidget {
  final Widget child;
  const AppStateWidget({super.key, required this.child});

  

  static AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  AppStateWidgetState createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  AppState appState = AppState(messages: []);

  void addMessage(Message message) {
    setState(() {
      appState = appState.copyWith(messages: [...appState.messages, message]);
    });
  }


  
  @override
  Widget build(BuildContext context) {
    return AppStateScope(appState, child: widget.child);
  }
}