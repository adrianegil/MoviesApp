import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Vista de Información Vacia.
class EmptyView extends StatelessWidget {
  String text;
  final VoidCallback? onTap;

  EmptyView(this.text, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/ic_empty_view.png",
            // Ruta de la imagen en los activos del dispositivo
            height: 120,
            width: 120,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if (onTap != null)
            MaterialButton(
              onPressed: onTap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.blue,
              height: 40,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("try_again".tr, style: TextStyle(color: Colors.white)),
                  SizedBox(width: 8),
                  Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
