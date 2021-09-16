import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/extensions/message_type_extension.dart';
import '../../../data/models/message.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rxn<Message> message) {
    ever<Message?>(message, (model) {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          colorText: Colors.white,
          duration: Duration(seconds: 5),
          backgroundColor: model.type.color(),
        );
      }
    });
  }
}
