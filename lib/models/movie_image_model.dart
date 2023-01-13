import 'package:json_annotation/json_annotation.dart';

part 'movie_image_model.g.dart';

@JsonSerializable()
class MovieImageModel {
  final List<Backdrops>? backdrops;
  final int? id;
  final List<Logos>? logos;
  final List<Posters>? posters;

  const MovieImageModel({
    this.backdrops,
    this.id,
    this.logos,
    this.posters,
  });

  factory MovieImageModel.fromJson(Map<String, dynamic> json) =>
      _$MovieImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieImageModelToJson(this);
}

@JsonSerializable()
class Backdrops {
  @JsonKey(name: 'aspect_ratio')
  final double? aspectRatio;
  final int? height;
  @JsonKey(name: 'file_path')
  final String? filePath;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  final int? width;

  const Backdrops({
    this.aspectRatio,
    this.height,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory Backdrops.fromJson(Map<String, dynamic> json) =>
      _$BackdropsFromJson(json);

  Map<String, dynamic> toJson() => _$BackdropsToJson(this);
}

@JsonSerializable()
class Logos {
  @JsonKey(name: 'aspect_ratio')
  final double? aspectRatio;
  final int? height;
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  @JsonKey(name: 'file_path')
  final String? filePath;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  final int? width;

  const Logos({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory Logos.fromJson(Map<String, dynamic> json) => _$LogosFromJson(json);

  Map<String, dynamic> toJson() => _$LogosToJson(this);
}

@JsonSerializable()
class Posters {
  @JsonKey(name: 'aspect_ratio')
  final double? aspectRatio;
  final int? height;
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  @JsonKey(name: 'file_path')
  final String? filePath;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  final int? width;

  const Posters({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory Posters.fromJson(Map<String, dynamic> json) =>
      _$PostersFromJson(json);

  Map<String, dynamic> toJson() => _$PostersToJson(this);
}
