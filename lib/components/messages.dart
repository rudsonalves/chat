import 'package:flutter/material.dart';

import '../core/services/auth/auth_service.dart';
import './message_bubble.dart';
import '../core/services/chat/chat_service.dart';
import '../core/models/chat_message.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;

    return StreamBuilder(
      stream: ChatService().messagesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No messages. Let\'s talk?'),
          );
        } else {
          final List<ChatMessage> msgs = snapshot.data!;
          return ListView.builder(
            reverse: true,
            itemCount: msgs.length,
            itemBuilder: (context, index) => MessageBubble(
              key: ValueKey(msgs[index].id),
              message: msgs[index],
              belongsToCurrentUser: currentUser?.id == msgs[index].userId,
            ),
          );
        }
      },
    );
  }
}
