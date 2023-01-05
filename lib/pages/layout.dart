import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_catalogue/models/movies_model.dart';
import 'package:movie_catalogue/utils/responsive.dart';
import 'package:provider/provider.dart';

import '../provider/movie_provider.dart';
import '../widgets/main_pane.dart';
import '../widgets/sort_control.dart';
import '../widgets/profile_section.dart';
import '../widgets/search_bar.dart';
import '../utils/constants.dart';
import '../widgets/left_pane.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _currentPage = 2;
  final _scrollController = ScrollController();
  List<MovieResults>? movieResults;

  @override
  void initState() {
    super.initState();
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    movieProvider.getPopularMovies(true);
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
            ++movieProvider.page;
          });
          movieProvider.getPopularMovies(false);
        }
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    final movieData = movieProvider.movieResults;

    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.indigo.withOpacity(0.80),
              actions: [
                TextButton.icon(
                  onPressed: () {},
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
                mainNavAction: () {},
                onItemSelect: (value) {
                  setState(() {
                    _currentPage = value;
                  });
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
              ? MainPane(
                  movieData: movieData,
                  scrollController: _scrollController,
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
                        mainNavAction: () {},
                        onItemSelect: (value) => _currentPage = value,
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
                                searchBar(),
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
                              child: MainPane(
                                movieData: movieData,
                                scrollController: _scrollController,
                              ),
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
