import 'package:json_annotation/json_annotation.dart';

part 'add_room_response_dto.g.dart';

@JsonSerializable()
class AddRoomResponseDto {
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

  AddRoomResponseDto ({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory AddRoomResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddRoomResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddRoomResponseDtoToJson(this);
  }
}


