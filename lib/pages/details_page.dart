import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../models/movie_image_model.dart';
import '../utils/responsive.dart';
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
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  List<bool> _isSelected = [];
  @override
  void initState() {
    final movieDetailProvider = context.read<MovieDetailProvider>();
    movieDetailProvider.getMovieDetails(widget.movieId);
    movieDetailProvider.getMovieImages(widget.movieId);
    super.initState();
  }

  List<Widget> generateImageTiles(List<Posters>? posters) {
    return posters!
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              posterImageBaseHigh + element.filePath!,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final movieDetailProvider = Provider.of<MovieDetailProvider>(context);
    final movieDetails = movieDetailProvider.movieDetailModel;
    final moviePosters = movieDetailProvider.movieImageModel?.posters;
    final imageItems = generateImageTiles(moviePosters);
    _isSelected = List.generate(moviePosters!.length, (index) => false);
    return Scaffold(
      extendBodyBehindAppBar:
          ResponsiveWidget.isSmallScreen(context) ? false : true,
      appBar: AppBar(
        backgroundColor: ResponsiveWidget.isSmallScreen(context)
            ? appBarBackground
            : Colors.transparent,
        elevation: ResponsiveWidget.isSmallScreen(context) ? null : 0,
      ),
      body: movieDetailProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : movieDetails == null
              ? const Center(
                  child: Text(
                    detailsUnavailable,
                    style: TextStyle(fontSize: 20),
                  ),
                )

              ///Using this container to set backdrop image background
              : Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: movieDetails.backdropPath != null
                      ? BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              backdropImageBase + movieDetails.backdropPath!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        )
                      : const BoxDecoration(
                          color: backdropBackground,
                        ),

                  /// Using this container to give black overlay effect
                  child: Container(
                    color: backdropShadeColor,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              screenWidth(context) * 0.05,
                              ResponsiveWidget.isSmallScreen(context)
                                  ? screenHeight(context) * 0.05
                                  : screenHeight(context) * 0.10,
                              screenWidth(context) * 0.05,
                              screenHeight(context) * 0.05,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '${movieDetails.title} (${movieDetails.releaseDate?.substring(0, 4)})',
                                  style: TextStyle(
                                    fontSize:
                                        ResponsiveWidget.isSmallScreen(context)
                                            ? 26
                                            : 28,
                                    color: textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: FittedBox(
                                    child: Text(
                                      movieDetails.tagline ?? '',
                                      style: const TextStyle(
                                          color: textColorLight70,
                                          fontSize: 22,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            overview,
                            style: TextStyle(
                              fontSize: 20,
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  ResponsiveWidget.isSmallScreen(context)
                                      ? screenWidth(context) * 0.12
                                      : screenWidth(context) * 0.25,
                              vertical: 10,
                            ),
                            child: Text(
                              movieDetails.overview ?? '',
                              style: TextStyle(
                                fontSize:
                                    ResponsiveWidget.isSmallScreen(context)
                                        ? 16
                                        : 20,
                                color: textColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: ResponsiveWidget.isSmallScreen(context)
                                ? null
                                : screenWidth(context) * 0.35,
                            child: CarouselSlider(
                              items: imageItems,
                              options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                aspectRatio:
                                    ResponsiveWidget.isSmallScreen(context)
                                        ? 8 / 10
                                        : 8 / 10,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentIndex = index;
                                    for (int itemIndex = 0;
                                        itemIndex < imageItems.length;
                                        itemIndex++) {
                                      if (itemIndex == index) {
                                        _isSelected[itemIndex] = true;
                                      } else {
                                        _isSelected[itemIndex] = false;
                                      }
                                    }
                                  });
                                },
                              ),
                              carouselController: _carouselController,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
