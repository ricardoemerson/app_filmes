import 'package:get/get.dart';

import '../../data/repositories/login/i_login_repository.dart';
import '../../data/repositories/login/login_repository.dart';
import '../../data/services/api/rest_client.dart';
import '../../data/services/auth/auth_service.dart';
import '../../data/services/login/i_login_service.dart';
import '../../data/services/login/login_service.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );

    Get.lazyPut<ILoginRepository>(
      () => LoginRepository(),
      fenix: true,
    );

    Get.lazyPut<ILoginService>(
      () => LoginService(loginRepository: Get.find()),
      fenix: true,
    );

    Get.put(AuthService()).init();
  }
}
