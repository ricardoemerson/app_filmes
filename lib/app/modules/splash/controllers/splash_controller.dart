import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  Future<void> onReady() async {
    super.onReady();

    await 2.seconds.delay();

    Get.offAllNamed('/login');
  }
}
