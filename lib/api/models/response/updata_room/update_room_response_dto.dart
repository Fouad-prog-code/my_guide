import 'package:json_annotation/json_annotation.dart';

part 'update_room_response_dto.g.dart';

@JsonSerializable()
class UpdateRoomResponseDto {
  @JsonKey(name: "succeeded")
  final bool? succeeded;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final String? data;
  @JsonKey(name: "errors")
  final dynamic? errors;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "meta")
  final dynamic? meta;

  UpdateRoomResponseDto ({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory UpdateRoomResponseDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateRoomResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateRoomResponseDtoToJson(this);
  }
}


