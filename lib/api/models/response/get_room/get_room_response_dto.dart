import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/get_room/get_room_data_dto.dart';

part 'get_room_response_dto.g.dart';

@JsonSerializable()
class GetRoomResponseDto {
  @JsonKey(name: "succeeded")
  final bool? succeeded;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<GetRoomDataDto>? data;
  @JsonKey(name: "errors")
  final dynamic? errors;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "meta")
  final dynamic? meta;

  GetRoomResponseDto({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory GetRoomResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetRoomResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetRoomResponseDtoToJson(this);
  }
}
