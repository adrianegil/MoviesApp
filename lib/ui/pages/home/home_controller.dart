import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moviesapp/network/model/genre_model.dart';
import 'package:moviesapp/network/model/movie_model.dart';

/// Controladora que maneja la lógica de funcionamiento de la vista del Home.
class HomeController extends GetxController {
  /// Controlador del  Campo de Texto para la búsqueda por Título
  TextEditingController searchTxtFieldController = TextEditingController();

  List<GenreModel> genres = [
    GenreModel(id: 28, name: "Action"),
    GenreModel(id: 12, name: "Adventure"),
    GenreModel(id: 16, name: "Animation"),
    GenreModel(id: 35, name: "Comedy"),
    GenreModel(id: 80, name: "Crime"),
    GenreModel(id: 99, name: "Documentary"),
    GenreModel(id: 18, name: "Drama"),
    GenreModel(id: 10751, name: "Family"),
    GenreModel(id: 14, name: "Fantasy"),
    GenreModel(id: 36, name: "History"),
    GenreModel(id: 27, name: "Horror"),
    GenreModel(id: 10402, name: "Music"),
    GenreModel(id: 9648, name: "Mystery"),
    GenreModel(id: 10749, name: "Romance"),
    GenreModel(id: 878, name: "Science Fiction"),
    GenreModel(id: 10770, name: "TV Movie"),
    GenreModel(id: 53, name: "Thriller"),
    GenreModel(id: 10752, name: "War"),
    GenreModel(id: 37, name: "Western")
  ];

  List<MovieModel> popularMovies = [
    MovieModel(
      adult: false,
      backdropPath: "/9BQqngPfwpeAfK7c2H3cwIFWIVR.jpg",
      id: 1079091,
      originalLanguage: "en",
      originalTitle: "It Ends with Us",
      overview: "When a woman's first love suddenly reenters her life...",
      popularity: 1506.809,
      posterPath: "/cSMdFWmajaX4oUMLx7HEDI84GkP.jpg",
      releaseDate: "2024-08-07",
      title: "It Ends with Us",
      video: false,
      voteAverage: 6.901,
      voteCount: 398,
    ),
    MovieModel(
      adult: false,
      backdropPath: "/p5ozvmdgsmbWe0H8Xk7Rc8SCwAB.jpg",
      id: 1022789,
      originalLanguage: "en",
      originalTitle: "Inside Out 2",
      overview:
          "Teenager Riley's mind headquarters is undergoing a sudden demolition...",
      popularity: 1282.57,
      posterPath: "/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
      releaseDate: "2024-06-11",
      title: "Inside Out 2",
      video: false,
      voteAverage: 7.667,
      voteCount: 3738,
    ),
    MovieModel(
      adult: false,
      backdropPath: "/lgkPzcOSnTvjeMnuFzozRO5HHw1.jpg",
      id: 519182,
      originalLanguage: "en",
      originalTitle: "Despicable Me 4",
      overview: "Gru and Lucy and their girls—Margo, Edith and Agnes...",
      popularity: 1130.468,
      posterPath: "/wWba3TaojhK7NdycRhoQpsG0FaH.jpg",
      releaseDate: "2024-06-20",
      title: "Despicable Me 4",
      video: false,
      voteAverage: 7.168,
      voteCount: 1701,
    ),
  ];
}
