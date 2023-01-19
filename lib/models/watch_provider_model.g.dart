// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchProviderModel _$WatchProviderModelFromJson(Map<String, dynamic> json) =>
    WatchProviderModel(
      id: json['id'] as int?,
      results: json['results'] == null
          ? null
          : Results.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WatchProviderModelToJson(WatchProviderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      CA: json['CA'] == null
          ? null
          : Ca.fromJson(json['CA'] as Map<String, dynamic>),
      IN: json['IN'] == null
          ? null
          : In.fromJson(json['IN'] as Map<String, dynamic>),
      US: json['US'] == null
          ? null
          : Us.fromJson(json['US'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'CA': instance.CA,
      'IN': instance.IN,
      'US': instance.US,
    };

Ca _$CaFromJson(Map<String, dynamic> json) => Ca(
      link: json['link'] as String?,
      flatrate: (json['flatrate'] as List<dynamic>?)
          ?.map((e) => FlatRate.fromJson(e as Map<String, dynamic>))
          .toList(),
      rent: (json['rent'] as List<dynamic>?)
          ?.map((e) => Rent.fromJson(e as Map<String, dynamic>))
          .toList(),
      buy: (json['buy'] as List<dynamic>?)
          ?.map((e) => Buy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CaToJson(Ca instance) => <String, dynamic>{
      'link': instance.link,
      'flatrate': instance.flatrate,
      'rent': instance.rent,
      'buy': instance.buy,
    };

FlatRate _$FlatRateFromJson(Map<String, dynamic> json) => FlatRate(
      logoPath: json['logo_path'] as String?,
      providerId: json['provider_id'] as int?,
      providerName: json['provider_name'] as String?,
      displayPriority: json['display_priority'] as int?,
    );

Map<String, dynamic> _$FlatRateToJson(FlatRate instance) => <String, dynamic>{
      'logo_path': instance.logoPath,
      'provider_id': instance.providerId,
      'provider_name': instance.providerName,
      'display_priority': instance.displayPriority,
    };

Rent _$RentFromJson(Map<String, dynamic> json) => Rent(
      logoPath: json['logo_path'] as String?,
      providerId: json['provider_id'] as int?,
      providerName: json['provider_name'] as String?,
      displayPriority: json['display_priority'] as int?,
    );

Map<String, dynamic> _$RentToJson(Rent instance) => <String, dynamic>{
      'logo_path': instance.logoPath,
      'provider_id': instance.providerId,
      'provider_name': instance.providerName,
      'display_priority': instance.displayPriority,
    };

Buy _$BuyFromJson(Map<String, dynamic> json) => Buy(
      logoPath: json['logo_path'] as String?,
      providerId: json['provider_id'] as int?,
      providerName: json['provider_name'] as String?,
      displayPriority: json['display_priority'] as int?,
    );

Map<String, dynamic> _$BuyToJson(Buy instance) => <String, dynamic>{
      'logo_path': instance.logoPath,
      'provider_id': instance.providerId,
      'provider_name': instance.providerName,
      'display_priority': instance.displayPriority,
    };

In _$InFromJson(Map<String, dynamic> json) => In(
      link: json['link'] as String?,
      rent: (json['rent'] as List<dynamic>?)
          ?.map((e) => Rent.fromJson(e as Map<String, dynamic>))
          .toList(),
      buy: (json['buy'] as List<dynamic>?)
          ?.map((e) => Buy.fromJson(e as Map<String, dynamic>))
          .toList(),
      flatrate: (json['flatrate'] as List<dynamic>?)
          ?.map((e) => FlatRate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InToJson(In instance) => <String, dynamic>{
      'link': instance.link,
      'rent': instance.rent,
      'buy': instance.buy,
      'flatrate': instance.flatrate,
    };

Us _$UsFromJson(Map<String, dynamic> json) => Us(
      link: json['link'] as String?,
      buy: (json['buy'] as List<dynamic>?)
          ?.map((e) => Buy.fromJson(e as Map<String, dynamic>))
          .toList(),
      flatrate: (json['flatrate'] as List<dynamic>?)
          ?.map((e) => FlatRate.fromJson(e as Map<String, dynamic>))
          .toList(),
      rent: (json['rent'] as List<dynamic>?)
          ?.map((e) => Rent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsToJson(Us instance) => <String, dynamic>{
      'link': instance.link,
      'buy': instance.buy,
      'flatrate': instance.flatrate,
      'rent': instance.rent,
    };
