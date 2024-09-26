import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/network/model/movie_model.dart';
import 'package:moviesapp/network/utils/url_provider.dart';
import 'package:moviesapp/ui/widgets/loading_view.dart';

class MovieByTitleItemList extends StatelessWidget {
  MovieModel movieModel;
  final VoidCallback? onTap;

  MovieByTitleItemList({super.key, required this.movieModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: movieModel,
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: "${UrlProvider.IMAGE_URL}/${movieModel.posterPath}",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    LoadingView(),
                errorWidget: (context, url, error) => Icon(Icons.image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
