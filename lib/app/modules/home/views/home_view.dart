import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/app_filmes_icons_icons.dart';
import '../../../data/extensions/theme_extension.dart';
import '../../favorites/views/favorites_view.dart';
import '../../movies/views/movies_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
              settings: settings,
              page: () => MoviesView(),
            );
          }

          if (settings.name == '/favorites') {
            return GetPageRoute(
              settings: settings,
              page: () => FavoritesView(),
            );
          }

          return null;
        },
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: context.themeRed,
          unselectedItemColor: Colors.grey,
          onTap: controller.goToView,
          currentIndex: controller.pageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Filmes',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppFilmesIcons.heart_empty),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout_outlined),
              label: 'Sair',
            ),
          ],
        );
      }),
    );
  }
}
