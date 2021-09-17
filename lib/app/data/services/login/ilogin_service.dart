import 'package:firebase_auth/firebase_auth.dart';

abstract class ILoginService {
  Future<UserCredential> login();
  Future<void> logout();
}
