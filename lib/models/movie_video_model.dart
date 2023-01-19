import 'package:json_annotation/json_annotation.dart';

part 'movie_video_model.g.dart';

@JsonSerializable()
class MovieVideoModel {
  final int? id;
  final List<Results>? results;

  const MovieVideoModel({
    this.id,
    this.results,
  });

  factory MovieVideoModel.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideoModelToJson(this);
}

@JsonSerializable()
class Results {
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  @JsonKey(name: 'published_at')
  final String? publishedAt;
  final String? id;

  const Results({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
