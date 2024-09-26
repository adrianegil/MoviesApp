import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/network/utils/url_provider.dart';
import 'package:moviesapp/ui/pages/movie_details/movie_details_controller.dart';
import 'package:moviesapp/ui/styles/app_colors.dart';
import 'package:moviesapp/ui/widgets/loading_view.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final controller = Get.put(MovieDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: controller.movieModel!,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CachedNetworkImage(
                      width: double.infinity,
                      height: 400,
                      fit: BoxFit.fill,
                      imageUrl:
                          "${UrlProvider.IMAGE_URL}/${controller.movieModel?.posterPath}",
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => LoadingView(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Positioned(
                      top: 24,
                      left: 0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios,
                            color: AppColors.primaryColor),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    controller.movieModel?.title ?? "",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    controller.movieModel?.overview ?? "",
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Release Date: ${controller.movieModel?.releaseDate ?? ""}",
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
                            controller.movieModel!.voteAverage.toString(),
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
              ])
            ],
          ),
        ),
      ),
    );
  }
}
