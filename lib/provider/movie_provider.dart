import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../services/dio_provider.dart';
import '../models/movies_model.dart';
import '../services/api_client.dart';

class MovieProvider with ChangeNotifier {
  MoviesModel? moviesModel;
  List<MovieResults> nowPlayingMovieResults = [];
  List<MovieResults> popularMovieResults = [];
  List<MovieResults> upcomingMovieResults = [];
  List<MovieResults> topRatedMovieResults = [];
  List<MovieResults> searchMovieResults = [];
  final client = ApiClient(dioProvider());
  bool isLoading = false;
  bool loadMore = false;
  int page = 1;

  getPopularMovies(bool loading) {
    isLoading = loading;
    loadMore = true;
    client.getPopularMovies(apiKey, page).then((value) {
      moviesModel = value;
      value.results?.forEach((element) {
        popularMovieResults.add(element);
      });
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      debugPrint(e);
      notifyListeners();
    });
  }

  getTopRatedMovies(bool loading) {
    isLoading = loading;
    loadMore = true;
    client.getTopRatedMovies(apiKey, page).then((value) {
      moviesModel = value;
      value.results?.forEach((element) {
        topRatedMovieResults.add(element);
      });
      isLoading = false;
      loadMore = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      loadMore = false;
      debugPrint(e);
      notifyListeners();
    });
  }

  getNowPlayingMovies(bool loading) {
    isLoading = loading;
    loadMore = true;
    client.getNowPlayingMovies(apiKey, page).then((value) {
      moviesModel = value;
      value.results?.forEach((element) {
        nowPlayingMovieResults.add(element);
      });
      isLoading = false;
      loadMore = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      loadMore = false;
      debugPrint(e);
      notifyListeners();
    });
  }

  getUpcomingMovies(bool loading) {
    isLoading = loading;
    loadMore = true;
    client.getUpcomingMovies(apiKey, page).then((value) {
      moviesModel = value;
      value.results?.forEach((element) {
        upcomingMovieResults.add(element);
      });
      isLoading = false;
      loadMore = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      loadMore = false;
      debugPrint(e);
      notifyListeners();
    });
  }

  searchMovie(bool loading, String searchQuery) {
    isLoading = loading;
    loadMore = true;
    client
        .searchMovie(
      apiKey,
      searchQuery,
      false,
      page,
    )
        .then((value) {
      moviesModel = value;
      value.results?.forEach((element) {
        searchMovieResults.add(element);
      });
      isLoading = false;
      loadMore = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      loadMore = false;
      debugPrint(e);
      notifyListeners();
    });
  }
}
