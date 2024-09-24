import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/home/home_page.dart';
import 'app_routes.dart';

/// Listado de pantallas de la app
class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
    ),
  ];
}
