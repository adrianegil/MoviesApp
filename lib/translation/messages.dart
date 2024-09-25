import 'package:get/get.dart';

/// Clase encargada de definir las variables asociadas a los textos en los diferentes idiomas
class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //Idioma Español
        "es_ES": {
          "splash": "Splash",
          "home": "Inicio",
          "do_you_want_to_exit": "¿Desea Cerrar la App?",
          "exit": "Salir",
          "required": "Requerido",
        },
        //Idioma Ingles
        "en_US": {
          "splash": "Splash",
          "home": "Home",
          "do_you_want_to_exit": "Do you want to close the app?",
          "exit": "Exit",
          "required": "Required",
        }
      };
}
