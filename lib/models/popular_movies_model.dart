import 'package:json_annotation/json_annotation.dart';

part 'popular_movies_model.g.dart';

@JsonSerializable()
class MoviesModel {
  final int? page;
  final List<MovieResults>? results;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;
  @JsonKey(name: 'status_message')
  final String? statusMessage;
  final bool? success;
  @JsonKey(name: 'status_code')
  final String? statusCode;

  MoviesModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    this.success,
    this.statusMessage,
    this.statusCode,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesModelToJson(this);
}

@JsonSerializable()
class MovieResults {
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

  MovieResults({
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

  factory MovieResults.fromJson(Map<String, dynamic> json) =>
      _$MovieResultsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResultsToJson(this);
}
