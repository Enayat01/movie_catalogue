import 'package:json_annotation/json_annotation.dart';

part 'watch_provider_model.g.dart';

@JsonSerializable()
class WatchProviderModel {
  final int? id;
  final Results? results;

  const WatchProviderModel({
    this.id,
    this.results,
  });

  factory WatchProviderModel.fromJson(Map<String, dynamic> json) =>
      _$WatchProviderModelFromJson(json);

  Map<String, dynamic> toJson() => _$WatchProviderModelToJson(this);
}

@JsonSerializable()
class Results {
  final Ca? CA;
  final In? IN;
  final Us? US;

  const Results({
    this.CA,
    this.IN,
    this.US,
  });

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

@JsonSerializable()
class Ca {
  final String? link;
  final List<FlatRate>? flatrate;
  final List<Rent>? rent;
  final List<Buy>? buy;

  const Ca({
    this.link,
    this.flatrate,
    this.rent,
    this.buy,
  });

  factory Ca.fromJson(Map<String, dynamic> json) => _$CaFromJson(json);

  Map<String, dynamic> toJson() => _$CaToJson(this);
}

@JsonSerializable()
class FlatRate {
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  @JsonKey(name: 'provider_id')
  final int? providerId;
  @JsonKey(name: 'provider_name')
  final String? providerName;
  @JsonKey(name: 'display_priority')
  final int? displayPriority;

  const FlatRate({
    this.logoPath,
    this.providerId,
    this.providerName,
    this.displayPriority,
  });

  factory FlatRate.fromJson(Map<String, dynamic> json) =>
      _$FlatRateFromJson(json);

  Map<String, dynamic> toJson() => _$FlatRateToJson(this);
}

@JsonSerializable()
class Rent {
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  @JsonKey(name: 'provider_id')
  final int? providerId;
  @JsonKey(name: 'provider_name')
  final String? providerName;
  @JsonKey(name: 'display_priority')
  final int? displayPriority;

  const Rent({
    this.logoPath,
    this.providerId,
    this.providerName,
    this.displayPriority,
  });

  factory Rent.fromJson(Map<String, dynamic> json) => _$RentFromJson(json);

  Map<String, dynamic> toJson() => _$RentToJson(this);
}

@JsonSerializable()
class Buy {
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  @JsonKey(name: 'provider_id')
  final int? providerId;
  @JsonKey(name: 'provider_name')
  final String? providerName;
  @JsonKey(name: 'display_priority')
  final int? displayPriority;

  const Buy({
    this.logoPath,
    this.providerId,
    this.providerName,
    this.displayPriority,
  });

  factory Buy.fromJson(Map<String, dynamic> json) => _$BuyFromJson(json);

  Map<String, dynamic> toJson() => _$BuyToJson(this);
}

@JsonSerializable()
class In {
  final String? link;
  final List<Rent>? rent;
  final List<Buy>? buy;
  final List<FlatRate>? flatrate;

  const In({
    this.link,
    this.rent,
    this.buy,
    this.flatrate,
  });

  factory In.fromJson(Map<String, dynamic> json) => _$InFromJson(json);

  Map<String, dynamic> toJson() => _$InToJson(this);
}

@JsonSerializable()
class Us {
  final String? link;
  final List<Buy>? buy;
  final List<FlatRate>? flatrate;
  final List<Rent>? rent;

  const Us({
    this.link,
    this.buy,
    this.flatrate,
    this.rent,
  });

  factory Us.fromJson(Map<String, dynamic> json) => _$UsFromJson(json);

  Map<String, dynamic> toJson() => _$UsToJson(this);
}
