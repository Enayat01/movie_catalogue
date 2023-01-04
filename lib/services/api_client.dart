import 'package:dio/dio.dart';
import '../models/search_movie_model.dart';
import '../models/popular_movies_model.dart';
import 'package:retrofit/http.dart';

import '../utils/constants.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  @GET('/movie/popular?api_key={apiKey}')
  Future<MoviesModel> getPopularMovies(
    @Path('apiKey') String apiKey,
  );

  @GET('/search/movie')
  Future<SearchMovieModel> searchMovie(
    @Query('api_key') String apiKey,
    @Query('query') String searchQuery,
    @Query('include_adult') bool includeAdult,
  );
}
