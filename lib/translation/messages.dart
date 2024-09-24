import 'package:get/get.dart';

/// Clase encargada de definir las variables asociadas a los textos en los diferentes idiomas
class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //Idioma Español
        "es_ES": {
          "splash": "Splash",
          "home": "Inicio",
        },
        //Idioma Ingles
        "en_US": {
          "splash": "Splash",
          "home": "Home",
        }
      };
}
