import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_catalogue/utils/constants.dart';

import 'package:provider/provider.dart';

import '../pages/search_page.dart';
import '../provider/movie_provider.dart';

class AppSearchPage extends StatefulWidget {
  const AppSearchPage({Key? key}) : super(key: key);

  @override
  State<AppSearchPage> createState() => _AppSearchPageState();
}

class _AppSearchPageState extends State<AppSearchPage> {
  final _scrollController = ScrollController();
  final _textEditingController = TextEditingController();
  @override
  void initState() {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _scrollController.addListener(() {
      infiniteScroll(movieProvider);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  void infiniteScroll(MovieProvider movieProvider) {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !movieProvider.isLoading) {
      if (movieProvider.page != movieProvider.moviesModel?.totalPages) {
        setState(() {
          movieProvider.page++;
          movieProvider.searchMovie(false, _textEditingController.text);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: kToolbarHeight * 0.7,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            controller: _textEditingController,
            onChanged: (value) {
              movieProvider.page = 1;
              movieProvider.searchMovieResults.clear();
              movieProvider.searchMovie(true, value);
              setState(() {});
            },
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _textEditingController.clear();
                },
              ),
              hintText: searchHintApp,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: kToolbarHeight / 5,
              ),
            ),
          ),
        ),
      ),
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
          child: Center(
            child: _textEditingController.text.isEmpty
                ? const Center(
                    child: Text(
                      'Search Movies',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                      ),
                    ),
                  )
                : movieProvider.isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : SearchPage(
                        movieData: movieProvider.searchMovieResults,
                        scrollController: _scrollController,
                        isGridview: true,
                      ),
          ),
        ),
      ),
    );
  }
}
