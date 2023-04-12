import 'package:flutter/material.dart';

import '../../models/chat_notification.dart';

class ChatNotificationService with ChangeNotifier {
  final List<ChatNotification> _items = [];

  List<ChatNotification> get items => [..._items];

  int get itemsCount => _items.length;

  ChatNotification? getItemAt(int index) {
    if (_items.length > index) {
      return _items[index];
    }
    return null;
  }

  void add(ChatNotification notification) {
    _items.add(notification);
    notifyListeners();
  }

  void remove(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
