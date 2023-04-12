import 'package:flutter/material.dart';

import '../components/new_message.dart';
import '../core/services/auth/auth_service.dart';
import '../components/messages.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        centerTitle: true,
        actions: [
          DropdownButton(
            items: [
              DropdownMenuItem(
                value: 'logout',
                child: Row(
                  children: const [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black87,
                    ),
                    SizedBox(width: 10),
                    Text('Exit'),
                  ],
                ),
              ),
            ],
            onChanged: (value) {
              if (value == 'logout') {
                AuthService().logout();
              }
            },
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(
              child: Message(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
