import 'package:chat/core/models/chat_notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/services/notification/chat_notification_service.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ChatNotificationService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: service.itemsCount,
        itemBuilder: (context, index) {
          ChatNotification item = service.getItemAt(index)!;
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.body),
            onTap: () => service.remove(index),
          );
        },
      ),
    );
  }
}
