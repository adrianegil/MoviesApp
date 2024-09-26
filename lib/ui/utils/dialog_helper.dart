import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'info_type.dart';

///Clase que se utiliza para mostrar AlertDialogs Genéricos
class DialogHelper {
  /// Método utilizado para crear un diálogo de espera.
  static Future showDialogLoading(
      {String? titulo, required String mensaje}) async {
    return Get.dialog(
        PopScope(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Ajusta el radio de los bordes según sea necesario
              ),
              title: Text(titulo ?? 'Espere por favor'),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    child: CupertinoActivityIndicator(
                      radius: 15,
                    ),
                  ),
                  Expanded(
                    child: Text(mensaje),
                  )
                ],
              ),
            ),
            canPop: false),
        barrierDismissible: false);
  }

  /// Método utilizado para crear un diálogo de información.
  static Future showCustomDialog(
      {required String message, required InfoType infoType}) {
    IconData iconData;
    Color iconColor;

    // Asignar el icono y el color según el tipo de Diálogo
    switch (infoType) {
      case InfoType.SUCCESS:
        iconData = Icons.check_circle;
        iconColor = Colors.green;
        break;
      case InfoType.WARNING:
        iconData = Icons.warning;
        iconColor = Colors.orange;
        break;
      case InfoType.ERROR:
        iconData = Icons.error;
        iconColor = Colors.red;
        break;
      default:
        iconData = Icons.info;
        iconColor = Colors.blue;
    }

    return Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              size: 90, // Tamaño del icono de información
              color: iconColor, // Color del icono
            ),
            SizedBox(height: 16),
            Text(message),
          ],
        ),
        actions: [
          TextButton(
            child: Text(
              'Ok',
              style: TextStyle(fontSize: 16),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  /// Función que permite mostrar un AlertDialog de Confirmación antes de realizar determinada acción
  static void showQuestionDialogWhitAction(String bodyText,
      [VoidCallback? action]) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.help_outline,
              size: 90.0,
              color: Colors.yellow,
            ),
            SizedBox(
              height: 16,
            ),
            Text(bodyText),
          ],
        ),
        actions: [
          TextButton(
              child: Text(
                "cancel".tr,
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Get.back();
              }),
          TextButton(
              child: Text("accept".tr),
              onPressed: () {
                Get.back();
                if (action != null) action();
              }),
        ],
      ),
    );
  }
}
