import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/network/model/movie_model.dart';
import 'package:moviesapp/network/utils/url_provider.dart';
import 'package:moviesapp/ui/widgets/loading_view.dart';

class MovieByGenreItemList extends StatelessWidget {
  MovieModel movieModel;
  final VoidCallback? onTap;

  MovieByGenreItemList({super.key, required this.movieModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4.0,
        margin: EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: movieModel,
                child: CachedNetworkImage(
                  width: 120,
                  height: 180,
                  fit: BoxFit.cover,
                  imageUrl: "${UrlProvider.IMAGE_URL}/${movieModel.posterPath}",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      LoadingView(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          movieModel.title ?? "",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      // Descripción
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          movieModel.overview ?? "",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      Text(
                        "Release Date: ${movieModel.releaseDate ?? ""}",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(
                        height: 8,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
