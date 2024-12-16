import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'marvel_response.g.dart';

@includeInBarrelFile
@JsonSerializable(genericArgumentFactories: true, constructor: '_')
class MarvelResponse<T> {
  const MarvelResponse._({required this.data});

  factory MarvelResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$MarvelResponseFromJson(json, fromJsonT);

  @JsonKey(name: 'data')
  final T data;
}
