// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

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

Hospital _$HospitalFromJson(Map<String, dynamic> json) {
  return Hospital(
      display_name: json['display_name'] as String,
      place_id: json['place_id'] as String,
      lat: (json['lat'] as num)?.toDouble(),
      lon: (json['lon'] as num)?.toDouble());
}

Map<String, dynamic> _$HospitalToJson(Hospital instance) => <String, dynamic>{
      'display_name': instance.display_name,
      'place_id': instance.place_id,
      'lat': instance.lat,
      'lon': instance.lon
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return Locations(
      hospitals: (json['hospitals'] as List)
          ?.map((e) =>
              e == null ? null : Hospital.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$LocationsToJson(Locations instance) =>
    <String, dynamic>{'hospitals': instance.hospitals};
