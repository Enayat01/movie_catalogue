import 'package:json_annotation/json_annotation.dart';

part 'search_movie_model.g.dart';

@JsonSerializable()
class SearchMovieModel {
  final int? page;
  final List<SearchResults>? results;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;
  @JsonKey(name: 'status_message')
  final String? statusMessage;
  final bool? success;
  @JsonKey(name: 'status_code')
  final String? statusCode;

  SearchMovieModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    this.success,
    this.statusMessage,
    this.statusCode,
  });

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMovieModelToJson(this);
}

@JsonSerializable()
class SearchResults {
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final dynamic backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  final int? id;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final dynamic posterPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final String? title;
  final bool? video;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  SearchResults({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory SearchResults.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultsToJson(this);
}
