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
          "search_by_title": "Buscar por Título",
          "genres": "Géneros",
          "error_loading_movie_genres":
              "Error al Cargar los Géneros de las Películas",
          "most_popular_movies": "Películas más Populares",
          "failed_to_get_movies": "Fallo al obtener Películas",
          "top_rated_movies": "Películas mejor Valoradas",
          "there_are_no_movies_to_show": "No hay Peliculas para mostrar",
          "search": "Búsqueda",
          "try_again": "Volver a intentar",
        },
        //Idioma Ingles
        "en_US": {
          "do_you_want_to_exit": "Do you want to close the app?",
          "exit": "Exit",
          "required": "Required",
          "failed_to_connect_to_server": "Failed to connect to server",
          "http_call_failed": "Http call failed",
          "search_by_title": "Search by Title",
          "genres": "Genres",
          "error_loading_movie_genres": "Error Loading Movie Genres",
          "most_popular_movies": "Most Popular Movies",
          "failed_to_get_movies": "Failed to get movies",
          "top_rated_movies": "Top Rated Movies",
          "there_are_no_movies_to_show": "There are no movies to show",
          "search": "Search",
          "try_again": "Try Again",
        }
      };
}
