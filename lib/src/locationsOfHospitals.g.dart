// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locationsOfHospitals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLng _$LatLngFromJson(Map<String, dynamic> json) {
  return LatLng(
      lat: (json['lat'] as num)?.toDouble(),
      lng: (json['lng'] as num)?.toDouble());
}

Map<String, dynamic> _$LatLngToJson(LatLng instance) =>
    <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};

Geometry _$GeometryFromJson(Map<String, dynamic> json) {
  return Geometry(
      location: json['location'] == null
          ? null
          : LatLng.fromJson(json['location'] as Map<String, dynamic>));
}

Map<String, dynamic> _$GeometryToJson(Geometry instance) =>
    <String, dynamic>{'location': instance.location};

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
      location: json['location'] == null
          ? null
          : LatLng.fromJson(json['location'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LocationToJson(Location instance) =>
    <String, dynamic>{'location': instance.location};

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      formatted_address: json['formatted_address'] as String,
      name: json['name'] as String,
      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'formatted_address': instance.formatted_address,
      'name': instance.name,
      'geometry': instance.geometry
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return Locations(
      results: (json['results'] as List)
          ?.map((e) =>
              e == null ? null : Result.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$LocationsToJson(Locations instance) =>
    <String, dynamic>{'results': instance.results};
