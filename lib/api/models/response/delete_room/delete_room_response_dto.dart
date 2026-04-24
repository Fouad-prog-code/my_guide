import 'package:json_annotation/json_annotation.dart';

part 'delete_room_response_dto.g.dart';

@JsonSerializable()
class DeleteRoomResponseDto {
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

  DeleteRoomResponseDto ({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory DeleteRoomResponseDto.fromJson(Map<String, dynamic> json) {
    return _$DeleteRoomResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeleteRoomResponseDtoToJson(this);
  }
}


