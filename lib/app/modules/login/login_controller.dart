import 'package:get/get.dart';

import '../../core/ui/loader/loader_mixin.dart';
import '../../core/ui/messages/messages_mixin.dart';
import '../../data/models/message.dart';
import '../../data/services/login/i_login_service.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final ILoginService _loginService;

  final loading = false.obs;
  final message = Rxn<Message>();

  LoginController({
    required ILoginService loginService,
  }) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();

    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      // loading.value = true;
      loading(true);

      await _loginService.login();

      loading(false);

      message(
        Message.info(
            title: 'Acesso Realizado',
            message: 'Você foi autenticado com sucesso ao sistema.'),
      );
    } catch (err, stk) {
      print('err: $err');
      print('stk: $stk');

      loading(false);

      message(
        Message.error(
            title: 'Falha na Autenticação',
            message: 'Erro ao realizar seu acesso ao sistema.'),
      );
    }
  }
}
