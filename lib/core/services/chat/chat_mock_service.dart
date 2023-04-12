import 'dart:async';
import 'dart:math';

// import '../../../utils/constants.dart';
import '../../models/chat_user.dart';
import '../../models/chat_message.dart';
import './chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msg = [
    // ChatMessage(
    //   id: '1',
    //   text: 'Bom dia',
    //   createdAt: DateTime.now(),
    //   userId: '123',
    //   userName: 'Bia',
    //   userImageURL: defaultAvatarImage,
    // ),
    // ChatMessage(
    //   id: '2',
    //   text: 'Bom dia. Como está?',
    //   createdAt: DateTime.now(),
    //   userId: '124',
    //   userName: 'Ana',
    //   userImageURL: defaultAvatarImage,
    // ),
    // ChatMessage(
    //   id: '3',
    //   text: 'Estou bem.',
    //   createdAt: DateTime.now(),
    //   userId: '123',
    //   userName: 'Bia',
    //   userImageURL: defaultAvatarImage,
    // ),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    _controller?.add(_msg);
  });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _msgStream;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageUrl,
    );

    _msg.add(newMessage);
    _controller?.add(_msg.reversed.toList());
    return newMessage;
  }
}
