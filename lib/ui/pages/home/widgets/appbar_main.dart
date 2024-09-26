import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../styles/app_colors.dart';
import '../../../utils/dialog_helper.dart';

/// AppBar Principal de la app.
class AppBarMain extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onUserIconPressed;

  AppBarMain({
    Key? key,
    this.onUserIconPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      centerTitle: true,
      title: Center(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              const SizedBox(width: 8),
              Image.asset(
                "assets/images/logo.png",
                width: 35,
                height: 35,
              ),
              const SizedBox(width: 8),
              Text(
                "MoviesApp",
                style: TextStyle(color: AppColors.primaryColor),
              )
            ],
          ),
        ),
      ),
      actions: [
        PopupMenuButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          icon: const Icon(
            Icons.more_vert_rounded,
            size: 28,
            color: AppColors.primaryColor,
          ),
          onSelected: (value) {
            switch (value) {
              case 'exit':
                DialogHelper.showQuestionDialogWhitAction(
                    "do_you_want_to_exit".tr, () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                });
                break;
              default:
                break;
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'exit',
              child: Row(
                children: [
                  const Icon(Icons.exit_to_app),
                  const SizedBox(width: 12),
                  Text('exit'.tr),
                ],
              ),
            ),
          ],
        ),
      ],
      elevation: 0,
      shadowColor: AppColors.primaryColor,
    );
  }
}
