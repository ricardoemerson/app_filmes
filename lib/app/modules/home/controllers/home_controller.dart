import 'package:get/get.dart';

import '../../../data/services/login/login_service.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  static const INDEX_VIEW_EXIT = 2;

  final LoginService _loginService;
  final _pages = ['/movies', '/favorites'];
  final _pageIndex = 0.obs;

  HomeController({
    required LoginService loginService,
  }) : _loginService = loginService;

  int get pageIndex => _pageIndex.value;

  void goToView(int view) {
    _pageIndex(view);

    if (view == INDEX_VIEW_EXIT) {
      _loginService.logout();
    } else {
      Get.offNamed(_pages[view], id: NAVIGATOR_KEY);
    }
  }
}
