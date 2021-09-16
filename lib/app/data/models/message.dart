import '../enums/message_type.dart';

class Message {
  final String title;
  final String message;
  final MessageType type;

  Message({
    required this.title,
    required this.message,
    required this.type,
  });

  Message.info({
    required this.title,
    required this.message,
  }) : type = MessageType.info;

  Message.error({
    required this.title,
    required this.message,
  }) : type = MessageType.error;
}
