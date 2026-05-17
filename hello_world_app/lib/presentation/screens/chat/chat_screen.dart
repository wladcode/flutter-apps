import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:hello_world_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:hello_world_app/presentation/widgets/fields/message_field_box.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return index % 2 == 0 ? MyMessageBubble() : HerMessageBubble();
                },
              ),
            ),
            MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}