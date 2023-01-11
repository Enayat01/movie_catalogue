import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';
import '../provider/movie_detail_provider.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;
  const MovieDetailsPage({required this.movieId, Key? key}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  void initState() {
    final movieDetailProvider = context.read<MovieDetailProvider>();
    movieDetailProvider.getMovieDetails(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieDetailProvider = Provider.of<MovieDetailProvider>(context);
    final movieDetails = movieDetailProvider.movieDetailModel;
    return Scaffold(
      body: movieDetailProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : movieDetails == null
              ? const Center(
                  child: Text(
                    'Details not available',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : Container(
                  ///Setting a background image for entire layout
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Using Backdrop filter to blur the image
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                            height: screenHeight(context) * 0.6,
                            width: double.infinity,
                            decoration: movieDetails.backdropPath != null
                                ? BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        backdropImageBase +
                                            movieDetails.backdropPath!,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : const BoxDecoration(color: Colors.grey),
                            child: Container(
                              color: Colors.black45,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 50.0,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          '${movieDetails.title!} (${movieDetails.releaseDate!.substring(0, 4)})',
                                          style: const TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(movieDetails.tagline ?? ''),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    'Overview',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 100,
                                      vertical: 10,
                                    ),
                                    child: Text(
                                      movieDetails.overview ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
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
