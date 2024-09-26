import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Widget de Error personalizable y reutilizable en interfaz visual de la app.
class ErrorView extends StatelessWidget {
  String text;
  final VoidCallback? onTap;

  ErrorView(this.text, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 100, color: Colors.red),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 22,
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
