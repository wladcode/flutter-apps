import 'package:hello_world_app/domain/entities/message.dart';

class AppState {
  final List<Message> messages;
  final Set<String> itemsInCart;

  AppState({
    required this.messages,
    this.itemsInCart = const <String>{},
  });

  AppState copyWith({
    List<Message>? messages,
    Set<String>? itemsInCart,
  }) {
    return AppState(
      messages: messages ?? this.messages, 
      itemsInCart: itemsInCart ?? this.itemsInCart,
    );
  }

  
}
