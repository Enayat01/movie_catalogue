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
  bool _isGridView = true;

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
        isGridview: _isGridView,
      ),
      MostPopularPage(
        movieData: movieProvider.popularMovieResults,
        scrollController: _scrollController,
        isGridview: _isGridView,
      ),
      UpcomingPage(
        movieData: movieProvider.upcomingMovieResults,
        scrollController: _scrollController,
        isGridview: _isGridView,
      ),
      TopChartPage(
        movieData: movieProvider.topRatedMovieResults,
        scrollController: _scrollController,
        isGridview: _isGridView,
      ),
      SearchPage(
        movieData: movieProvider.searchMovieResults,
        scrollController: _scrollController,
        isGridview: _isGridView,
      )
    ];
  }

  @override
  void didChangeDependencies() {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);

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
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    screen = [
      NowPlayingPage(
        movieData: movieProvider.nowPlayingMovieResults,
        scrollController: _scrollController,
        isGridview: _isGridView,
      ),
      MostPopularPage(
        movieData: movieProvider.popularMovieResults,
        scrollController: _scrollController,
        isGridview: _isGridView,
      ),
      UpcomingPage(
        movieData: movieProvider.upcomingMovieResults,
        scrollController: _scrollController,
        isGridview: _isGridView,
      ),
      TopChartPage(
        movieData: movieProvider.topRatedMovieResults,
        scrollController: _scrollController,
        isGridview: _isGridView,
      ),
      SearchPage(
        movieData: movieProvider.searchMovieResults,
        scrollController: _scrollController,
        isGridview: _isGridView,
      )
    ];

    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: appBarBackground,
              actions: [
                IconButton(
                  onPressed: () {
                    _isGridView = false;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.view_list,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _isGridView = true;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.view_module,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: iconColorLight),
                  ),
                  child: TextButton.icon(
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
                      color: iconColorLight,
                    ),
                    label: const Text(
                      search,
                      style: TextStyle(
                        color: textColorLight,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : null,
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? Drawer(
              backgroundColor: leftPaneBackground,
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
          child: ResponsiveWidget.isSmallScreen(context)

              ///showing loading indicator
              ? Center(
                  child: movieProvider.isLoading
                      ? const CircularProgressIndicator(
                          color: indicatorColorDark,
                        )

                      /// Showing only main pane for mobile view
                      : screen[_currentPage],
                )

              /// Main parent row
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Left pane column for navigation section
                    Container(
                      width: screenWidth(context) * .20,
                      color: leftPaneBackground,
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
                            color: mainHeaderBackground,
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
                            color: subHeaderBackground,
                            child: sortControl(
                              context,
                              () {
                                _isGridView = false;
                                setState(() {});
                              },
                              () {
                                _isGridView = true;
                                setState(() {});
                              },
                            ),
                          ),

                          /// Main Pane section
                          Expanded(
                            child: Center(
                              child: movieProvider.isLoading
                                  ? const CircularProgressIndicator(
                                      color: indicatorColorDark,
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
