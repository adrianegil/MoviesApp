import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

///Clase que se utiliza para mostrar AlertDialogs Genéricos
class DialogHelper {
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
