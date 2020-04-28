import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:zachranka/pages/home.dart';

part 'locationsOfDrugstores.g.dart';

@JsonSerializable()
class LatLng {
  LatLng({
    this.lat,
    this.lng,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);

  final double lat;
  final double lng;
}

@JsonSerializable()
class Geometry {
  Geometry({
    this.location,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryToJson(this);

  final LatLng location;
}

@JsonSerializable()
class Location {
  Location({
    this.location,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);

  final LatLng location;
}

@JsonSerializable()
class Result {
  Result({
    this.formatted_address,
    this.icon,
    this.name,
    this.geometry
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);

  final String formatted_address;
  final String icon;
  final String name;
  final Geometry geometry;
}

@JsonSerializable()
class Locations {
  Locations({
    this.results,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<Result> results;
}

Future<Locations> getGoogleOffices() async {
  String googleLocationsURL = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=lekarna&location=${position.latitude},${position.longitude}&radius=50000&key=AIzaSyCCBabnwtGGsDvLWIXYls-ghbAs2F5DS0g';

  // Retrieve the locations of Google offices
  final response = await http.get(googleLocationsURL);
  if (response.statusCode == 200) {
    return Locations.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
            ' ${response.reasonPhrase}',
        uri: Uri.parse(googleLocationsURL));
  }
}