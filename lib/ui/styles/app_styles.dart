import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Estilos personalizados
class AppStyles {

  /// Estilos de TextField para el borde normal
  static OutlineInputBorder textFieldBorderNormal = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(14),
    ),
    borderSide: BorderSide(
      color: Colors.black26,
    ),
  );

  /// Estilos de TextField para el borde de foco
  static OutlineInputBorder textFieldBorderFocused = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(14),
    ),
    borderSide: BorderSide(
      color: AppColors.primaryColor,
    ),
  );

  /// Estilos de TextField para el borde de error
  static OutlineInputBorder textFieldBorderError = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(14),
    ),
    borderSide: BorderSide(
      color: Colors.red,
    ),
  );
}
