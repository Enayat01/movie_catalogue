import 'package:flutter/material.dart';
import '../models/movie_image_model.dart';
import '../models/movie_detail_model.dart';
import '../services/api_client.dart';
import '../services/dio_provider.dart';
import '../utils/constants.dart';

class MovieDetailProvider with ChangeNotifier {
  MovieDetailModel? movieDetailModel;
  MovieImageModel? movieImageModel;
  final client = ApiClient(dioProvider());
  bool isLoading = false;

  getMovieDetails(int movieId) async {
    isLoading = true;
    String appendToResponse = 'videos,images';
    await client
        .getMovieDetails(movieId, apiKey, appendToResponse)
        .then((value) {
      movieDetailModel = value;
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      debugPrint(e);
      notifyListeners();
    });
  }

  getMovieImages(int movieId) {
    isLoading = true;
    client.getMovieImages(apiKey, movieId).then((value) {
      movieImageModel = value;
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      debugPrint(e);
      notifyListeners();
    });
  }
}
