import 'package:get/get.dart';

/// Clase encargada de definir las variables asociadas a los textos en los diferentes idiomas
class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //Idioma Español
        "es_ES": {
          "do_you_want_to_exit": "¿Desea Cerrar la App?",
          "exit": "Salir",
          "required": "Requerido",
          "failed_to_connect_to_server": "Fallo en la conexión al servidor",
          "http_call_failed": "Fallo en la llamada http",
        },
        //Idioma Ingles
        "en_US": {
          "do_you_want_to_exit": "Do you want to close the app?",
          "exit": "Exit",
          "required": "Required",
          "failed_to_connect_to_server": "Failed to connect to server",
          "http_call_failed": "Http call failed",
        }
      };
}
