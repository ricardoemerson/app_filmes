import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  User? user;

  void init() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      this.user = user;

      await 2.seconds.delay();

      if (user == null) {
        Get.offAllNamed('/login');
      } else {
        Get.offAllNamed('/home');
      }
    });
  }
}
