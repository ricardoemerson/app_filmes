import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image(
            height: Get.height,
            width: Get.width,
            image: AssetImage('assets/images/splash_background.png'),
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black45,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                Hero(
                  tag: 'logo-splash',
                  child: Image(
                    image: AssetImage('assets/images/logo_filmes.png'),
                  ),
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: Get.width * .85,
                  height: 42,
                  child: SignInButton(
                    Buttons.Google,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    text: 'Entrar com o Google',
                    onPressed: controller.login,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
