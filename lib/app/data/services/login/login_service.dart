import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/login/i_login_repository.dart';
import 'i_login_service.dart';

class LoginService implements ILoginService {
  final ILoginRepository _loginRepository;

  LoginService({
    required ILoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  @override
  Future<UserCredential> login() => _loginRepository.login();

  @override
  Future<void> logout() => _loginRepository.logout();
}
