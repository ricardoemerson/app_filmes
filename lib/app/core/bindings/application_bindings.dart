import 'package:get/get.dart';

import '../../data/repositories/login/login_repository.dart';
import '../../data/services/login/login_service.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginRepository(), permanent: true);
    Get.put(LoginService(loginRepository: Get.find()), permanent: true);
  }
}
