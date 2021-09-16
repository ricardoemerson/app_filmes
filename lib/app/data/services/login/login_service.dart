import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/login/login_repository.dart';
import 'ilogin_service.dart';

class LoginService implements ILoginService {
  final LoginRepository _loginRepository;

  LoginService({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  @override
  Future<UserCredential> login() => _loginRepository.login();
}
