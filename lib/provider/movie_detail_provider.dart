import 'package:flutter/material.dart';
import '../models/movie_detail_model.dart';
import '../services/api_client.dart';
import '../services/dio_provider.dart';
import '../utils/constants.dart';

class MovieDetailProvider with ChangeNotifier {
  MovieDetailModel? movieDetailModel;
  final client = ApiClient(dioProvider());
  bool isLoading = false;

  getMovieDetails(String movieId) {
    isLoading = true;
    notifyListeners();
    client.getMovieDetails(apiKey, movieId).then((value) {
      movieDetailModel = value;
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      debugPrint(e);
      notifyListeners();
    });
  }
}
