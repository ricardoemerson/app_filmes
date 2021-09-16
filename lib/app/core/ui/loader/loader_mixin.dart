import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loaderRx) {
    ever<bool>(loaderRx, (loading) async {
      if (loading) {
        await Get.dialog(
          Center(
            child: CircularProgressIndicator(),
          ),
          barrierDismissible: false,
        );
      } else {
        Get.back();
      }
    });
  }
}