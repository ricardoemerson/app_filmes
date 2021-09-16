import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Hero(
              tag: 'logo-splash',
              child: Image.asset('assets/images/logo_filmes.png')),
        ),
      ),
    );
  }
}
