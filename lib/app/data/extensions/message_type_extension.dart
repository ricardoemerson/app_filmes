import 'package:flutter/material.dart';

import '../enums/message_type.dart';

extension MessageTypeExtension on MessageType {
  Color color() {
    switch (this) {
      case MessageType.info:
        return Colors.blue[300] ?? Colors.blue;
      case MessageType.error:
        return Colors.red[600] ?? Colors.red;
    }
  }
}
