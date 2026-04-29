import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/data_dto.dart';

part 'room_response_dto.g.dart';

@JsonSerializable()
class RoomResponseDto {
  @JsonKey(name: "succeeded")
  final bool? succeeded;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<DataDto>? data;
  @JsonKey(name: "errors")
  final dynamic? errors;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "meta")
  final dynamic? meta;

  RoomResponseDto({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory RoomResponseDto.fromJson(Map<String, dynamic> json) {
    return _$RoomResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RoomResponseDtoToJson(this);
  }
}
