import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/most_popular_page.dart';
import '../pages/now_playing_page.dart';
import '../pages/search_page.dart';
import '../pages/top_chart_page.dart';
import '../pages/upcoming_page.dart';
import '../pages/app_search_page.dart';

import '../provider/movie_provider.dart';

import '../widgets/sort_control.dart';
import '../widgets/profile_section.dart';
import '../widgets/search_bar.dart';
import '../widgets/left_pane.dart';

import '../utils/responsive.dart';
import '../utils/constants.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _currentPage = 0;
  final _scrollController = ScrollController();
  final _textEditingController = TextEditingController();
  List screen = [];

  @override
  void initState() {
    super.initState();
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    movieProvider.getNowPlayingMovies(true);
    movieProvider.getPopularMovies(true);
    movieProvider.getUpcomingMovies(true);
    movieProvider.getTopRatedMovies(true);

    screen = [
      NowPlayingPage(
        movieData: movieProvider.nowPlayingMovieResults,
        scrollController: _scrollController,
      ),
      MostPopularPage(
        movieData: movieProvider.popularMovieResults,
        scrollController: _scrollController,
      ),
      UpcomingPage(
        movieData: movieProvider.upcomingMovieResults,
        scrollController: _scrollController,
      ),
      TopChartPage(
        movieData: movieProvider.topRatedMovieResults,
        scrollController: _scrollController,
      ),
      SearchPage(
        movieData: movieProvider.searchMovieResults,
        scrollController: _scrollController,
      )
    ];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    final movieProvider = Provider.of<MovieProvider>(context);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !movieProvider.isLoading) {
        if (movieProvider.page != movieProvider.moviesModel?.totalPages) {
          setState(() {
            movieProvider.page++;
          });
          if (_currentPage == 0) {
            movieProvider.getNowPlayingMovies(false);
          } else if (_currentPage == 1) {
            movieProvider.getPopularMovies(false);
          } else if (_currentPage == 2) {
            movieProvider.getUpcomingMovies(false);
          } else if (_currentPage == 3) {
            movieProvider.getTopRatedMovies(false);
          } else if (_currentPage == 4) {
            movieProvider.searchMovie(
              false,
              _textEditingController.text,
            );
          }
        }
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.indigo.withOpacity(0.80),
              actions: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AppSearchPage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          : null,
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? Drawer(
              backgroundColor: Colors.indigo.withOpacity(0.80),
              child: LeftPane(
                selected: _currentPage,
                onItemSelect: (value) {
                  _currentPage = value;
                },
              ),
            )
          : null,
      body: Container(
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

          /// Main parent row
          child: ResponsiveWidget.isSmallScreen(context)
              ? Center(
                  child: movieProvider.isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.indigo,
                        )
                      : screen[_currentPage],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Left pane column for navigation section
                    Container(
                      width: screenWidth(context) * .20,
                      color: Colors.indigo.withOpacity(0.95),
                      child: LeftPane(
                        selected: _currentPage,
                        onItemSelect: (value) {
                          _currentPage = value;
                        },
                      ),
                    ),

                    /// Right column for header and main pane
                    Expanded(
                      child: Column(
                        children: [
                          /// Header section with search and profile
                          Container(
                            height: screenHeight(context) * 0.15,
                            color: Colors.indigo.withOpacity(0.80),
                            child: Row(
                              children: [
                                searchBar(_textEditingController, (value) {
                                  setState(() {
                                    _currentPage = 4;
                                    movieProvider.page = 1;
                                  });
                                  movieProvider.searchMovieResults.clear();
                                  movieProvider.searchMovie(true, value);
                                }),
                                profileSection(),
                              ],
                            ),
                          ),

                          /// Filter section
                          Container(
                            height: screenHeight(context) * 0.15,
                            color: Colors.deepPurple.withOpacity(0.60),
                            child: Row(
                              children: [
                                sortControl(context),
                              ],
                            ),
                          ),

                          /// Main Pane section
                          Expanded(
                            child: Center(
                              child: movieProvider.isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.indigo,
                                    )
                                  : screen[_currentPage],
                            ),
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
