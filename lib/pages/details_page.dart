import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
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
  int _currentImageIndex = 0;
  int _currentPosterIndex = 0;
  List<bool> _isSelected = [];
  List<String> videoIds = [];
  List<bool> _isPosterSelected = [];
  final _carouselController = CarouselController();
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    final movieDetailProvider = context.read<MovieDetailProvider>();
    movieDetailProvider.getMovieDetails(widget.movieId);
    _youtubePlayerController = YoutubePlayerController(
      params: const YoutubePlayerParams(
        mute: true,
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final movieDetailProvider = context.watch<MovieDetailProvider>();
    videoIds.clear();
    videoIds = movieDetailProvider.movieDetailModel?.videos?.results
            ?.map((e) => e.key!)
            .toList() ??
        [];
    _youtubePlayerController.loadPlaylist(
      list: videoIds,
      listType: ListType.playlist,
    );
  }

  List<Widget> generateImageTiles(List<dynamic>? images) {
    return images
            ?.map(
              (element) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  posterImageBaseHigh + element.filePath!,
                  fit: BoxFit.cover,
                ),
              ),
            )
            .toList() ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    final movieDetailProvider = Provider.of<MovieDetailProvider>(context);
    final movieDetails = movieDetailProvider.movieDetailModel;
    final movieImages = movieDetailProvider.movieDetailModel?.images?.backdrops;
    final moviePosters = movieDetailProvider.movieDetailModel?.images?.posters;
    final movieImageItems = generateImageTiles(movieImages);
    final moviePosterItems = generateImageTiles(moviePosters);
    _isSelected = List.generate(movieImages?.length ?? 0, (index) => false);
    _isPosterSelected =
        List.generate(moviePosters?.length ?? 0, (index) => false);

    return Scaffold(
      extendBodyBehindAppBar:
          ResponsiveWidget.isSmallScreen(context) ? false : true,
      appBar: AppBar(
        backgroundColor: ResponsiveWidget.isSmallScreen(context)
            ? appBarBackground
            : webAppBarBackground,
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

              ///Using this container to set backdrop as image background
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
                      child: Padding(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: screenHeight(context) * 0.45,
                                  width: ResponsiveWidget.isSmallScreen(context)
                                      ? null
                                      : null,
                                  child: CarouselSlider(
                                    items: moviePosterItems,
                                    options: CarouselOptions(
                                      autoPlay: true,
                                      aspectRatio:
                                          ResponsiveWidget.isSmallScreen(
                                                  context)
                                              ? 4 / 4
                                              : 4 / 3,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          _currentPosterIndex = index;
                                          for (_currentPosterIndex = 0;
                                              _currentPosterIndex <
                                                  movieImageItems.length;
                                              _currentPosterIndex++) {
                                            if (_currentPosterIndex == index) {
                                              _isPosterSelected[
                                                  _currentPosterIndex] = true;
                                            } else {
                                              _isPosterSelected[
                                                  _currentPosterIndex] = false;
                                            }
                                          }
                                        });
                                      },
                                    ),
                                    carouselController: _carouselController,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${movieDetails.title} (${movieDetails.releaseDate?.substring(0, 4)})',
                                        style: TextStyle(
                                          fontSize:
                                              ResponsiveWidget.isSmallScreen(
                                                      context)
                                                  ? 26
                                                  : 28,
                                          color: textColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: screenHeight(context) / 80,
                                          bottom: screenHeight(context) / 30,
                                        ),
                                        child: Text(
                                          movieDetails.tagline ?? '',
                                          style: const TextStyle(
                                              color: textColorLight70,
                                              fontSize: 22,
                                              fontStyle: FontStyle.italic),
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
                                      Text(
                                        movieDetails.overview ?? '',
                                        style: TextStyle(
                                          fontSize:
                                              ResponsiveWidget.isSmallScreen(
                                                      context)
                                                  ? 16
                                                  : 20,
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: ResponsiveWidget.isSmallScreen(context)
                                  ? null
                                  : screenWidth(context) * 0.70,
                              child: CarouselSlider(
                                items: movieImageItems,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  aspectRatio:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 21 / 10
                                          : 18 / 8,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentImageIndex = index;
                                      for (_currentImageIndex = 0;
                                          _currentImageIndex <
                                              movieImageItems.length;
                                          _currentImageIndex++) {
                                        if (_currentImageIndex == index) {
                                          _isSelected[_currentImageIndex] =
                                              true;
                                        } else {
                                          _isSelected[_currentImageIndex] =
                                              false;
                                        }
                                      }
                                    });
                                  },
                                ),
                                carouselController: _carouselController,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: ResponsiveWidget.isSmallScreen(context)
                                  ? null
                                  : screenHeight(context) * .70,
                              width: ResponsiveWidget.isSmallScreen(context)
                                  ? null
                                  : screenWidth(context) * 0.70,
                              child: YoutubePlayer(
                                controller: _youtubePlayerController,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
