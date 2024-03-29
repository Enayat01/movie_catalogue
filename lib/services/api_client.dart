import 'package:dio/dio.dart';
import '../models/movies_model.dart';
import 'package:retrofit/http.dart';

import '../utils/constants.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/movie/popular?api_key={apiKey}&page={page}')
  Future<MoviesModel> getPopularMovies(
    @Path('apiKey') String apiKey,
    @Path('page') int page,
  );

  @GET('/movie/now_playing?api_key={apiKey}&page={page}')
  Future<MoviesModel> getNowPlayingMovies(
    @Path('apiKey') String apiKey,
    @Path('page') int page,
  );

  @GET('/movie/top_rated?api_key={apiKey}&page={page}')
  Future<MoviesModel> getTopRatedMovies(
    @Path('apiKey') String apiKey,
    @Path('page') int page,
  );

  @GET('/movie/upcoming?api_key={apiKey}&page={page}')
  Future<MoviesModel> getUpcomingMovies(
    @Path('apiKey') String apiKey,
    @Path('page') int page,
  );

  @GET('/search/movie')
  Future<MoviesModel> searchMovie(
    @Query('api_key') String apiKey,
    @Query('query') String searchQuery,
    @Query('include_adult') bool includeAdult,
    @Query('page') int page,
  );
}
