import 'package:flutter/material.dart';
import 'package:hello_world_app/domain/entities/message.dart';
import 'package:hello_world_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:hello_world_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:hello_world_app/presentation/widgets/_components/fields/message_field_box.dart';
import 'package:hello_world_app/state/provider/chat_provider.dart';
import 'package:provider/provider.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://robohash.org/chamow1'),
          ),
        ),
        title: const Text('Chat with Chamow'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}


class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Se observa el provider para que se actualice la lista de mensajes
    final chatProvider = context.watch<ChatProvider>();
    final messages = chatProvider.messages;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.scrollController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return message.fromWho == FromWho.me ? MyMessageBubble(message: message) : HerMessageBubble(message: message);
                },
              ),
            ),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}