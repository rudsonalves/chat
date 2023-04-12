import 'package:chat/core/models/chat_notification.dart';
import 'package:chat/core/services/notification/chat_notification_service.dart';

void main() {
  var chatNotification = ChatNotificationService();

  chatNotification.add(
    ChatNotification(
      title: 'Test1',
      body: 'Olá Test2.',
    ),
  );

  chatNotification.add(
    ChatNotification(
      title: 'Test2',
      body: 'Diga Test1. O que posso fazer por você?',
    ),
  );

  chatNotification.add(
    ChatNotification(
      title: 'Test1',
      body: 'Nada. Isto é apenas um teste!',
    ),
  );

  // print('Apresentar valores da lista');
  // print(chatNotification.items);

  // print('Remover elemento 1');
  chatNotification.remove(1);
  // print(chatNotification.items);
}
