import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../services/dio_provider.dart';
import '../models/popular_movies_model.dart';
import '../services/api_client.dart';

class MovieProvider with ChangeNotifier {
  MoviesModel? popularMoviesModel;
  List<MovieResults> popularResults = [];
  final client = ApiClient(dioProvider());
  bool isLoading = false;

  getPopularMovies() {
    isLoading = true;
    client.getPopularMovies(apiKey).then((value) {
      popularMoviesModel = value;
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      debugPrint(e);
      notifyListeners();
    });
  }
}
