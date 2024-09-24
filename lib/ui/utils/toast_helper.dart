import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'info_type.dart';

///Clase que se utiliza para mostrar Toast Genéricos
class ToastHelper {
  /// Método utilizado para crear un Toast Personalizados.
  static showCustomToast(
      {required String message,
      required InfoType infoType,
      String? title,
      VoidCallback? onTap}) {
    IconData iconData;
    Color toastColor;

    switch (infoType) {
      case InfoType.SUCCESS:
        iconData = Icons.check_circle;
        toastColor = Colors.green;
        break;
      case InfoType.WARNING:
        iconData = Icons.warning;
        toastColor = Colors.orange;
        break;
      case InfoType.ERROR:
        iconData = Icons.error;
        toastColor = Colors.red;
        break;
      default:
        iconData = Icons.info;
        toastColor = Colors.blue;
    }
    Get.rawSnackbar(
      title: title ?? null,
      messageText: Text(
        message,
        style: TextStyle(color: Colors.black),
      ),
      maxWidth: 450,
      backgroundColor: toastColor,
      borderRadius: 10,
      margin: EdgeInsets.all(10),
      borderColor: Colors.black,
      borderWidth: 1,
      duration: Duration(seconds: 3),
      icon: Icon(iconData, color: Colors.black),
      barBlur: 20,
      shouldIconPulse: false,
      isDismissible: true,
      mainButton: TextButton(
        onPressed: () {
          if (onTap != null)
            onTap();
          else
            Get.back();
        },
        child: Text(
          'OK',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
