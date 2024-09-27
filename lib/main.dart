import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/translation/messages.dart';
import 'package:moviesapp/ui/routes/app_pages.dart';
import 'package:moviesapp/ui/routes/app_routes.dart';
import 'package:moviesapp/ui/styles/app_colors.dart';

/// Inicializa la app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      navigatorKey: Get.key,
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.list,
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
    );
  }
}
