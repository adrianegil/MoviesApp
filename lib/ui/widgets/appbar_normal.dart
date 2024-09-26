import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moviesapp/ui/styles/app_colors.dart';

/// AppBar Principal de la app.
class AppBarNormal extends StatelessWidget implements PreferredSizeWidget {
  String? title;

  AppBarNormal({Key? key, this.title}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.primaryColor,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      title: Text(
        title ?? "MoviesApp",
        style: TextStyle(color: AppColors.primaryColor),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Image.asset(
            'assets/images/logo.png', // Reemplaza con la ruta de tu logo
            height: 25,
            width: 25,
          ),
        ),
      ],
    );
  }
}
