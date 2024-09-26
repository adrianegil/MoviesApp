import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/network/model/movie_model.dart';
import 'package:moviesapp/network/utils/url_provider.dart';

class MovieItemList extends StatelessWidget {

  MovieModel movieModel;
  final VoidCallback? onTap;

  MovieItemList({super.key, required this.movieModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.grey,
      borderRadius: BorderRadius.circular(18),
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(8.0),
        child: Container(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "${UrlProvider.IMAGE_URL}/${movieModel.posterPath}",
                fit: BoxFit.fill,
                width: 250,
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  movieModel.title ?? "",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  movieModel.overview ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Release Date: ${movieModel.releaseDate ?? ""}",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16.0,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          movieModel.voteAverage.toString(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
